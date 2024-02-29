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
            ProfileView()
        } else {
            AuthenticationView()
        }
    }
}

#Preview {
    MainView()
}
