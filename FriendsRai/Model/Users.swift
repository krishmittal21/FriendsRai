//
//  Users.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
