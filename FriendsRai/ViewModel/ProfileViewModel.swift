//
//  ProfileViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import Foundation
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    
    init(){}
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
