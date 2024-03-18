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
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Onboard3DView()
                    .frame(height: 500)
                
                VStack{
                    
                    Text("FriendsRai")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    VStack{
                        
                        Button{
                            Task {
                                await viewModel.signInWithGoogle()
                            }
                        } label: {
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
                        .frame(width: 350, height: 50)
                        .signInWithAppleButtonStyle(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        
                        NavigationLink(destination: EmailSignUpView()) {
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
                        .navigationTitle("")
                        .navigationBarBackButtonHidden(true)
                        
                        HStack{
                            Text("Already have an account?")
                                .foregroundStyle(Color.gray)
                            NavigationLink{
                                EmailLoginView()
                            } label: {
                                Text("Log In")
                                    .underline()
                                    .foregroundStyle(Color.primaryColor)
                            }
                        }
                        .padding(10)
                    }
                    .padding(40)
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
                .offset(x: 120, y: 213)
        }
    }
}
