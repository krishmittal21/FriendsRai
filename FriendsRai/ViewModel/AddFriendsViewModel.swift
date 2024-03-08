//
//  AddFriendsViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 06/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import ContactsUI
import Combine

class AddFriendsViewModel:  NSObject, ObservableObject, CNContactPickerDelegate {
    
    @Published var user:User? = nil
    @Published var contact:EmergencyContact? = nil
    @Published var contactName = ""
    @Published var contactNumber = ""
    @Published var fetchedContacts: [EmergencyContact] = []
    
    
    func deleteContact(_ contact: EmergencyContact) {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("emergencycontacts")
            .whereField("name", isEqualTo: contact.name)
            .whereField("phoneNumber", isEqualTo: contact.phoneNumber)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error deleting document: \(error)")
                    return
                }
                
                for document in snapshot!.documents {
                    document.reference.delete()
                }
                
                self.fetchedContacts.removeAll(where: { $0 == contact })
            }
    }
    
    
    
    func fetchContacts() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("emergencycontacts")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                var contacts: [EmergencyContact] = []
                for document in snapshot!.documents {
                    if
                        let name = document["name"] as? String,
                        let phoneNumber = document["phoneNumber"] as? String {
                        let contact = EmergencyContact(name: name, phoneNumber: phoneNumber)
                        contacts.append(contact)
                    }
                }
                self.fetchedContacts = contacts
            }
    }
    
    
    func openContactPicker() {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        contactPicker.displayedPropertyKeys = [CNContactPhoneNumbersKey, CNContactGivenNameKey]
        contactPicker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
        contactPicker.predicateForSelectionOfContact = NSPredicate(format: "phoneNumbers.@count == 1")
        contactPicker.predicateForSelectionOfProperty = NSPredicate(format: "key == 'phoneNumbers'")
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let window = windowScenes?.windows.first
        window?.rootViewController?.present(contactPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        contactName = contact.givenName
        if let phoneNumber = contact.phoneNumbers.first?.value {
            handlePhoneNumber(phoneNumber.stringValue)
        }
        saveContact()
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        if contactProperty.key == CNContactPhoneNumbersKey,
           let phoneNumber = contactProperty.value as? CNPhoneNumber {
            contactName = contactProperty.contact.givenName
            handlePhoneNumber(phoneNumber.stringValue)
        }
        saveContact()
    }
    
    func handlePhoneNumber(_ phoneNumber: String) {
        let phoneNumberWithoutSpace = phoneNumber.replacingOccurrences(of: " ", with: "")
        contactNumber = phoneNumberWithoutSpace
    }
    
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
