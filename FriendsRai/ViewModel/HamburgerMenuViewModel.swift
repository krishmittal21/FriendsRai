//
//  HamburgerMenuViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 07/03/24.
//

import Foundation
import FirebaseAuth

class HamburgerMenuViewModel: ObservableObject {
    
    init(){}
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
