//
//  AddFriendsView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 06/03/24.
//

import SwiftUI

struct AddFriendsView: View {
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text("Edit Friends")
                    Spacer()
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                    Image(systemName: "minus.circle.fill")
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
