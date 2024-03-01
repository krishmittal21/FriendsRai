//
//  AuthenticationView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI
import SplineRuntime

struct AuthenticationView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Onboard3DView()
                    .frame(height: 500)
                                
                VStack{
                    Text("Friends Rai")
                        .font(.title)
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
                                Text("SignIn with Google")
                                    .foregroundStyle(Color.blackColor)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
                        
                        Button{
                            Task {
                                
                            }
                        } label: {
                            HStack{
                                Image("apple")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                Text("SignIn with Apple")
                                    .foregroundStyle(Color.blackColor)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
                        
                        NavigationLink(destination: EmailSignUpView()) {
                            HStack{
                                Image(systemName: "envelope.fill")
                                    .resizable()
                                    .frame(width: 25,height: 20)
                                    .foregroundStyle(Color.primaryColor)
                                Text("SignUp with Email")
                                
                                    .foregroundStyle(Color.blackColor)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                        }
                        .buttonStyle(.bordered)
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
                        .offset(x: 110, y: 213)
                }
    }
}
