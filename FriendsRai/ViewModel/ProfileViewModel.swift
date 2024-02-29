//
//  ProfileViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var user:User? = nil
    
    init(){}
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
