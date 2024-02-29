//
//  ProfileView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        Button {
            viewModel.logout()
        } label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 40)
                
                Text("Log Out")
                    .foregroundStyle(.pink)
                    .font(.system(size: 15))
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ProfileView()
}
