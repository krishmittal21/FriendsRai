//
//  HamburgerMenuView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 07/03/24.
//

import SwiftUI

struct HamburgerMenuView: View {
    
    @StateObject var viewModel = HamburgerMenuViewModel()
    @Binding var isShowing: Bool
    @State private var selectedOption: HamburgerMenuOption?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    VStack(alignment: .leading, spacing: 32){
                        if let user = viewModel.user {
                            HamburgerMenuHeaderView(user: user)
                        } else {
                            Text("Loading Profile ..")
                        }
                        
                        VStack {
                            ForEach(HamburgerMenuOption.allCases){ option in
                                NavigationLink(destination: option.page, tag: option, selection: $selectedOption) {
                                    HamburgerMenuRowView(option: option, selectedOption: $selectedOption)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.logout()
                        } label: {
                            Text("Log Out")
                                .padding(.vertical, 8)
                                .padding(.horizontal,75)
                                .foregroundStyle(.red)
                                .font(.system(size: 15))
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    @ViewBuilder
    func HamburgerMenuHeaderView (user: User) -> some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6){
                Text(user.name)
                    .font(.subheadline)
                
                Text(user.email)
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
    
    
}

#Preview {
    HamburgerMenuView(isShowing: .constant(true))
}
