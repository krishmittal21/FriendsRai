//
//  AuthenticationView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI
import AuthenticationServices

struct AuthenticationView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    @State var isSignupView = false
    
    private func signInWithEmailPassword() {
        Task {
            await viewModel.signInWithEmailPassword()
        }
    }
    
    private func signInWithGoogle() {
        Task {
          if await viewModel.signInWithGoogle() == true {
          }
        }
    }
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("ghosts")
                    .resizable()
                    .frame(height: 200)
                    .frame(maxWidth: .none)
                
                VStack{
                    
                    Text("FriendsRai")
                        .bold()
                        .font(.title)
                        .frame(width: 360, alignment: .leading)
                        .padding(.bottom,20)
                    
                    HStack {
                        Image(systemName: "at")
                        TextField("Email", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.next)
                        
                    }
                    .frame(width: 360)
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 4)
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Password", text: $viewModel.password)
                            .submitLabel(.go)
                            .onSubmit {
                                signInWithEmailPassword()
                            }
                    }
                    .frame(width: 360)
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 8)
                    
                    Button (action: signInWithEmailPassword) {
                        if viewModel.authenticationState != .authenticating {
                            Text("Login")
                                .bold()
                                .foregroundStyle(Color.black)
                                .frame(width: 360)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .padding(.vertical, 8)
                                .frame(width: 360)
                        }
                    }
                    
                    HStack {
                        VStack { Divider() }
                        Text("or")
                        VStack { Divider() }
                    }
                    .frame(width: 360)
                    
                    Button(action: signInWithGoogle){
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 20,height: 20)
                            Text("Sign in with Google")
                                .bold()
                                .foregroundStyle(Color.neutralDarkColor)
                        }
                        .frame(width: 360)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    
                    SignInWithAppleButton(.signIn) { request in
                        viewModel.handleSignInWithAppleRequest(request)
                    } onCompletion: { result in
                        viewModel.handleSignInWithAppleCompletion(result)
                    }
                    .frame(width: 360, height: 50)
                    .signInWithAppleButtonStyle(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    Button{
                        isSignupView.toggle()
                    } label: {
                        HStack{
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: 25,height: 20)
                                .foregroundStyle(Color.primaryColor)
                            Text("Sign up with Email")
                                .bold()
                                .foregroundStyle(Color.neutralDarkColor)
                            
                        }
                        .frame(width: 360)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                }
                .padding()
                .sheet(isPresented: $isSignupView) {
                    EmailSignUpView()
                }
            }
        }
        .preferredColorScheme(.light)
    }
    
}

#Preview {
    AuthenticationView()
}
