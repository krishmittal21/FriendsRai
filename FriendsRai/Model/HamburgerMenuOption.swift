//
//  HamburgerMenuOption.swift
//  FriendsRai
//
//  Created by Krish Mittal on 07/03/24.
//

import SwiftUI

enum HamburgerMenuOption: Int, CaseIterable {
    case friends
    
    var title: String {
        switch self {
        case .friends:
            return "Friends"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .friends:
            return "person.fill"
        }
    }
    
    var page: AnyView {
        switch self {
        case .friends:
            return AnyView(AddFriendsView())
        }
    }
}

extension HamburgerMenuOption: Identifiable {
    var id: Int {return self.rawValue}
}
