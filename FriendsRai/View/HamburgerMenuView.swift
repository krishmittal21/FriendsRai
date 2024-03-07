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
                        HamburgerMenuHeaderView
                        
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
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                
                                Text("Log Out")
                                    .foregroundStyle(.pink)
                                    .font(.system(size: 15))
                            }
                        }
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        
        .animation(.easeInOut, value: isShowing)
    }
    
    @ViewBuilder
    var HamburgerMenuHeaderView: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6){
                Text("Krish Mittal")
                    .font(.subheadline)
                
                Text("contact@krishmittal.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
    
    
}

#Preview {
    HamburgerMenuView(isShowing: .constant(true))
}
