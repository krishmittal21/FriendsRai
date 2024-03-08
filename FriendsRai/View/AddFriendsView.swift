//
//  AddFriendsView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 06/03/24.
//

import SwiftUI

struct AddFriendsView: View {
    @StateObject var viewModel = AddFriendsViewModel()
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text("Edit Friends")
                    Spacer()
                    Image(systemName: "person.crop.circle.fill.badge.plus").imageScale(.medium)
                        .onTapGesture {
                            viewModel.openContactPicker()
                        }
                    Image(systemName: "minus.circle.fill").imageScale(.medium)
                }
                .padding()
                Spacer()
            }
            .navigationTitle("My Friends")
        }
    }
}

#Preview {
    AddFriendsView()
}
