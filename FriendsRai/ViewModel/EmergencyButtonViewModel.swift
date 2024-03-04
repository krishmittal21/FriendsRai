//
//  EmergencyButtonViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 02/03/24.
//

import SwiftUI
import MessageUI

class EmergencyButtonViewModel: NSObject, ObservableObject, MFMessageComposeViewControllerDelegate {
    
    @Published var message = ""
    
    func sendMessage(){
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = ["+919654998993"]
        composeVC.body = message
        
        UIApplication.shared.windows.first?.rootViewController?.present(composeVC, animated: true, completion: nil)
        
    }
    // MARK: - MFMessageComposeViewControllerDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
