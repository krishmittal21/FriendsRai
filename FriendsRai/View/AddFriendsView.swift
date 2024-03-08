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
                }
                .padding()
                List(viewModel.fetchedContacts, id: \.self) { contact in
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.phoneNumber)
                            .font(.subheadline)
                    }
                    .swipeActions{
                        Button("Delete"){
                            viewModel.deleteContact(contact)
                        }
                        .tint(.red)
                    }
                }
                
                Spacer()
                
            }
            .navigationTitle("My Friends")
            .onAppear{
                viewModel.fetchContacts()
            }
        }
    }
}

#Preview {
    AddFriendsView()
}
