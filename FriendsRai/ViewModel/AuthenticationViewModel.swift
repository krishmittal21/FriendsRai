//
//  AuthenticationViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit

@MainActor
class AuthenticationViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    let currentDate = ""
    @Published var errorMessage: String?
    @Published var displayName = ""
    private var currentNonce: String?
    enum AuthenticationError: Error {
        case tokenError(message: String)
    }
    
    private func insertUserRecord(id: String) {
        
        let newUser = FRUser(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func signOut() {
            do {
                try Auth.auth().signOut()
            }
            catch {
                print(error)
                errorMessage = error.localizedDescription
            }
    }
    
}

extension AuthenticationViewModel {
    
    func signInWithGoogle() async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase Config")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            print("There is no root view controller")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                throw AuthenticationError.tokenError(message: "ID token missing")
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            
            insertUserRecord(id: firebaseUser.uid)
            print("User \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknown")")
            
            return true
            
        }
        catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            return false
        }
    }
}

extension AuthenticationViewModel {
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        if case .failure(let failure) = result {
            errorMessage = failure.localizedDescription
        }
        else if case .success(let authorization) = result {
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                guard let nonce = currentNonce else {
                    fatalError("Invalid state: a login callback was received, but no login request was sent.")
                }
                guard let appleIDToken = appleIDCredential.identityToken else {
                    print("Unable to fetdch identify token.")
                    return
                }
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    print("Unable to serialise token string from data: \(appleIDToken.debugDescription)")
                    return
                }
                
                let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        await updateDisplayName(for: result.user, with: appleIDCredential)
                        name = appleIDCredential.displayName()
                        email = appleIDCredential.email ?? ""
                        insertUserRecord(id: result.user.uid)
                    }
                    catch {
                        print("Error authenticating: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func updateDisplayName(for user: User, with appleIDCredential: ASAuthorizationAppleIDCredential, force: Bool = false) async {
        if let currentDisplayName = Auth.auth().currentUser?.displayName, !currentDisplayName.isEmpty {
            // current user is non-empty, don't overwrite it
        }
        else {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = appleIDCredential.displayName()
            do {
                try await changeRequest.commitChanges()
                self.displayName = Auth.auth().currentUser?.displayName ?? ""
            }
            catch {
                print("Unable to update the user's displayname: \(error.localizedDescription)")
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func verifySignInWithAppleAuthenticationState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let providerData = Auth.auth().currentUser?.providerData
        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
            Task {
                do {
                    let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
                    switch credentialState {
                    case .authorized:
                        break // The Apple ID credential is valid.
                    case .revoked, .notFound:
                        // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                        self.signOut()
                    default:
                        break
                    }
                }
                catch {
                }
            }
        }
    }
    
}

extension ASAuthorizationAppleIDCredential {
    func displayName() -> String {
        return [self.fullName?.givenName, self.fullName?.familyName]
            .compactMap( {$0})
            .joined(separator: " ")
    }
}

private func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length
    
    while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
            var random: UInt8 = 0
            let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
            if errorCode != errSecSuccess {
                fatalError(
                    "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                )
            }
            return random
        }
        
        randoms.forEach { random in
            if remainingLength == 0 {
                return
            }
            
            if random < charset.count {
                result.append(charset[Int(random)])
                remainingLength -= 1
            }
        }
    }
    
    return result
}

private func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
    }.joined()
    
    return hashString
}
