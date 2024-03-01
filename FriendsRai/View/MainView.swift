//
//  ContentView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            AuthenticationView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            EmergencyButtonView()
                .tabItem { Label("Button", systemImage: "button.programmable") }
            MapView()
                .tabItem { Label("Map", systemImage: "mappin.circle") }
            HelplineNumberView()
                .tabItem { Label("List", systemImage: "list.bullet.circle.fill") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle.fill") }
        }
    }
}

#Preview {
    MainView()
}
