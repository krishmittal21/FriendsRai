//
//  ContentView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showMenu: Bool = false
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            AuthenticationView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        NavigationView{
            ZStack{
                TabView {
                    Group {
                        EmergencyButtonView()
                            .tabItem { Label("Button", systemImage: "button.programmable") }
                        MapView()
                            .tabItem { Label("Map", systemImage: "mappin.circle") }
                    }
                    .toolbarBackground(Color.backgroundColor, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                }
                HamburgerMenuView(isShowing: $showMenu)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbarBackground(Color.backgroundColor, for: .navigationBar)
            .navigationTitle("FriendsRai")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action:{
                        showMenu.toggle()
                    }, label: {
                            Image(systemName: "line.3.horizontal")
                        }
                    )
                }
            }
            
        }
    }
}

#Preview {
    MainView()
}
