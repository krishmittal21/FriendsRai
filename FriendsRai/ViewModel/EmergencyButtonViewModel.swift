//
//  EmergencyButtonViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 02/03/24.
//

import SwiftUI
import MessageUI
import MapKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class EmergencyButtonViewModel: NSObject, ObservableObject, MFMessageComposeViewControllerDelegate {
    
    @Published var message = ""
    
    func fetchContacts(completion: @escaping ([EmergencyContact]) -> Void) {
        guard let uId = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("emergencycontacts")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                    completion([])
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
                completion(contacts)
            }
    }
    
    
    func sendMessage() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        
        
        fetchContacts { contacts in
            let phoneNumbers = contacts.map { $0.phoneNumber }
            
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            composeVC.recipients = phoneNumbers
            composeVC.body = self.message
            if let userLocation = CLLocationManager().location {
                let locationString = "Latitude: \(userLocation.coordinate.latitude), Longitude: \(userLocation.coordinate.longitude)"
                let locationData = locationString.data(using: .utf8)!
                composeVC.addAttachmentData(locationData, typeIdentifier: "text/plain", filename: "user_location.txt")
            }
            
            UIApplication.shared.windows.first?.rootViewController?.present(composeVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - MFMessageComposeViewControllerDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
