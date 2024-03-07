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
                    EmergencyButtonView()
                        .tabItem { Label("Button", systemImage: "button.programmable") }
                    MapView()
                        .tabItem { Label("Map", systemImage: "mappin.circle") }
                    HelplineNumberView()
                        .tabItem { Label("List", systemImage: "list.bullet.circle.fill") }
                }
                HamburgerMenuView(isShowing: $showMenu)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
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
