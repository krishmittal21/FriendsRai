//
//  AuthenticationView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        
        NavigationView{
            
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
                            .foregroundStyle(.black)
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
                            .foregroundStyle(Color.green)
                        Text("SignUp with Email")
                        
                            .foregroundStyle(.black)
                        
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
                            .foregroundStyle(Color.green)
                    }
                }
                .padding(10)
            }
            .padding(40)
        }
    }
}

#Preview {
    AuthenticationView()
}
