//
//  EmailSignUpView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct EmailSignUpView: View {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    private func signUpWithEmailPassword() {
        Task {
            await viewModel.signUpWithEmailPassword()
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                VStack{
                    Text("Complete Your Profile")
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 27)
                    Text("Don't worry only you can see your personal info, no one else will be able to see it")
                        .frame(width: 350)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.gray)
                }
                
                VStack {
                    if  !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    HStack {
                        Image(systemName: "person")
                        TextField("Name", text: $viewModel.name)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.next)
                        
                    }
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 4)
                    
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
                            .submitLabel(.next)
                    }
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 8)
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .submitLabel(.go)
                            .onSubmit {
                                signUpWithEmailPassword()
                            }
                    }
                    .padding(.vertical, 6)
                    .background(Divider(), alignment: .bottom)
                    .padding(.bottom, 8)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Button (action: signUpWithEmailPassword) {
                        if viewModel.authenticationState != .authenticating || !viewModel.errorMessage.isEmpty {
                            Text("Sign up")
                                .bold()
                                .foregroundStyle(Color.blackColor)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("By Signing up, you agree to our")
                        NavigationLink(destination: TermsView()) {
                            Text("Terms & Conditions.")
                                .foregroundColor(.gray)
                                .underline()
                        }
                    }
                    .padding(.horizontal, 25)
                    .font(.caption)

                }

                Spacer()
            }
        }
    }
}

#Preview {
    EmailSignUpView()
}
