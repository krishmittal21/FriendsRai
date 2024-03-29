//
//  FRMessageCard.swift
//  FriendsRai
//
//  Created by Krish Mittal on 02/03/24.
//

import SwiftUI

struct FRMessageCard: View {
    
    let message: EmergencyMessage
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap){
            ZStack(){
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width:150,height: 125)
                    .foregroundColor(isSelected ? Color.primaryColor : .white)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
                    .overlay(
                        VStack {
                            Image(systemName: message.image)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Spacer()
                            Text(message.text)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                        }
                        .padding()
                    )
            }
        }
    }
}
