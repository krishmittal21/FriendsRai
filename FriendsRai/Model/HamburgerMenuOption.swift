//
//  HamburgerMenuOption.swift
//  FriendsRai
//
//  Created by Krish Mittal on 07/03/24.
//

import SwiftUI

enum HamburgerMenuOption: Int, CaseIterable {
    case friends
    case helplinelist
    
    var title: String {
        switch self {
        case .friends:
            return "Friends"
        case .helplinelist:
            return "Resources"
        
        }
    }
    
    var systemImageName: String {
        switch self {
        case .friends:
            return "person.fill"
        case .helplinelist:
            return "list.bullet"
        }
    }
    
    var page: AnyView {
        switch self {
        case .friends:
            return AnyView(AddFriendsView())
        case .helplinelist:
            return AnyView(HelplineNumberView())
        }
    }
}

extension HamburgerMenuOption: Identifiable {
    var id: Int {return self.rawValue}
}
