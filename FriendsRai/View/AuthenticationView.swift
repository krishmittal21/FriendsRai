//
//  AuthenticationView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI
import SplineRuntime
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
        
        NavigationView{
            
            ZStack{
                
                Onboard3DView()
                    .frame(height: 500)
                    .padding(.bottom,500)
                
                VStack{
                    
                    Text("FriendsRai")
                        .bold()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,20)
                    
                    HStack {
                        Image(systemName: "at")
                        TextField("Email", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.next)
                        
                    }
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
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 8)
                    
                    Button (action: signInWithEmailPassword) {
                        if viewModel.authenticationState != .authenticating {
                            Text("Login")
                                .bold()
                                .foregroundStyle(Color.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    HStack {
                        VStack { Divider() }
                        Text("or")
                        VStack { Divider() }
                    }
                    
                    Button(action: signInWithGoogle){
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 20,height: 20)
                            Text("Sign in with Google")
                                .bold()
                                .foregroundStyle(Color.blackColor)
                        }
                        .frame(maxWidth: .infinity)
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
                                .foregroundStyle(Color.blackColor)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                }
                .padding()
                .padding(.top,250)
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


struct Onboard3DView: View {
    var body: some View {
        
        // fetching from cloud
        //let url = URL(string: "https://build.spline.design/QGrYd1NbKDyAYxxrNAmM/scene.splineswift")!
        
        // // fetching from local
        let url = Bundle.main.url(forResource: "ghosts", withExtension: "splineswift")!
        
        return ZStack {
            try? SplineView(sceneFileURL: url)
                .edgesIgnoringSafeArea(.all)
            //Cover the Spline Logo
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 150, height: 60)
                .offset(x: 110, y: 210)
        }
    }
}
