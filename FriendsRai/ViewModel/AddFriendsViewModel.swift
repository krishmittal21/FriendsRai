//
//  AddFriendsViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 06/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddFriendsViewModel: ObservableObject {
    
    @Published var user:User? = nil
    @Published var contact:EmergencyContact? = nil
    @Published var contactName = ""
    @Published var contactNumber = ""
    
    init(){}
    
    func saveContact(){
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newContact = EmergencyContact(name: contactName, phoneNumber: contactNumber)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("emergencycontacts")
            .document(newId)
            .setData(newContact.asDictionary())
    }
}
