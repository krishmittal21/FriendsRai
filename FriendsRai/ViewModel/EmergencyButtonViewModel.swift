//
//  EmergencyButtonViewModel.swift
//  FriendsRai
//
//  Created by Krish Mittal on 02/03/24.
//

import SwiftUI
import MessageUI

class EmergencyButtonViewModel: NSObject, ObservableObject, MFMessageComposeViewControllerDelegate {
    
    func sendMessage(){
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = ["+919315672658"]
        composeVC.body = "Emergency message"
        
        UIApplication.shared.windows.first?.rootViewController?.present(composeVC, animated: true, completion: nil)
        
    }
    // MARK: - MFMessageComposeViewControllerDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
