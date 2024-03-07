//
//  HamburgerMenuRowView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 07/03/24.
//

import SwiftUI

struct HamburgerMenuRowView: View {
    let option: HamburgerMenuOption
    @Binding var selectedOption: HamburgerMenuOption?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            Text(option.title)
                .font(.subheadline)
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(Color.black)
        .frame(width: 216, height: 44)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
