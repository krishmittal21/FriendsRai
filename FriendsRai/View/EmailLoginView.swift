//
//  EmailLoginView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct EmailLoginView: View {
    
    @StateObject var viewModel = EmailLoginViewModel()
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Hello There! ")
                .font(.system(size: 35, weight: .medium, design: .rounded))
                .padding(.top,50)
            
            if  !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            
            Form {
                
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
                
            }
            .listSectionSpacing(10)
            .frame(height: 350)
            .scrollContentBackground(.hidden)
            
            FRButton(action: viewModel.login, backgroundColor: Color.blackColor, text: "Log In", textColor: .white)
            
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(Color.gray)
                NavigationLink{
                    EmailSignUpView()
                } label: {
                    Text("Sign Up")
                        .underline()
                        .foregroundStyle(Color.primaryColor)
                }
            }
            .padding(10)
            
        }
    }
}

#Preview {
    EmailLoginView()
}
