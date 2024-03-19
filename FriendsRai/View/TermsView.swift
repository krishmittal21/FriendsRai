//  TermsView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 19/03/24.

import SwiftUI

struct TermsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Terms and Conditions")
                    .font(.title)
                    .bold()
                
                Text("1. User Accounts and Friends List")
                    .bold()
                Text("To use the FriendsRai app, you must create an account and add your friends' contact information. The app will access your device's contacts to facilitate this process. You agree to only add contacts who have consented to receive emergency alerts from you via this app.")
                
                Text("2. Emergency Alerts")
                    .bold()
                Text("The primary purpose of this app is to rapidly notify your selected friends in case of an emergency situation. By using the SOS button or selecting an emergency option like \"I have an accident\" or \"I have been robbed\", you authorize the app to send automated alerts with your location data to your listed friends.")
                
                Text("3. Location Tracking")
                    .bold()
                Text("To provide the emergency locating features, the app requires access to your device's location services when the app is running.")
                
                Text("4. Data Use")
                    .bold()
                Text("The app collects limited personal information like your phone number for account setup. Location and emergency situation data is only temporarily cached to process alerts and is not stored long-term. No data is sold or shared for advertising or analytics purposes.")
                
                Text("5. Liability Limitations")
                    .bold()
                Text("The app facilitates communication during self-reported incidents but does not provide emergency response services. The creators cannot guarantee message delivery or response times in all scenarios. Use good judgment regarding life-threatening situations.")
                
                Text("6. Age Requirements")
                    .bold()
                Text("Due to the nature of emergency communications, this app is intended for users age 13 and older. Underage users require parental consent to create an account.")
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TermsView()
}
