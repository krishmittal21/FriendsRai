//
//  EmailSignUpView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct EmailSignUpView: View {
    @StateObject var viewModel = EmailSignUpViewModel()
    var body: some View {
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
            Spacer()
            if  !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            Form {
                Section{
                    HStack{
                        Image(systemName: "person")
                            .foregroundStyle(Color.gray)
                            .padding(.leading, 8)
                        TextField("Full Name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                        
                    )
                }
                
                Section{
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundStyle(Color.gray)
                            .padding(.leading, 8)
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                Section{
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                Section{
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(height: 50)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                
            }
            .listSectionSpacing(10)
            .frame(height: 350)
            .scrollContentBackground(.hidden)
            .padding(.bottom,10)
      
            Button {
                viewModel.register()
            } label: {
                Text("Sign Up")
            }
            HStack{
                Text("Have an account?")
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
    }
}

#Preview {
    EmailSignUpView()
}
