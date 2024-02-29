//
//  FirebaseHelper.swift
//  FriendsRai
//
//  Created by Krish Mittal on 29/02/24.
//

import Foundation
import FirebaseFirestore

class FirebaseHelper {
    
    static func insertUserRecord(id: String, name: String, email: String, joined: TimeInterval){
        let newUser = User(id: id, name: name, email: email, joined: joined)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
}
