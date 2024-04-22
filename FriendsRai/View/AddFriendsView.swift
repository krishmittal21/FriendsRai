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
        NavigationStack{
            VStack {
                HStack{
                    
                    Text("Add Friends")
                        .font(.title3)
                    
                    Spacer()
                    
                    Image(systemName:"person.crop.circle.fill.badge.plus")
                        .resizable()
                        .frame(width: 30,height: 25)
                        .foregroundStyle(Color.primaryColor)
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
                .padding()
                .listStyle(PlainListStyle())
                .cornerRadius(10)
                
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
