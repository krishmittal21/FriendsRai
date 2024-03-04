//
//  EmergencyMessages.swift
//  FriendsRai
//
//  Created by Krish Mittal on 02/03/24.
//

import Foundation

struct EmergencyMessage: Hashable {
    let image: String
    let text: String
}

let emergencyMessagesValues: [EmergencyMessage] = [
    EmergencyMessage(image: "figure.fall", text: "I have an accident"),
    EmergencyMessage(image: "bandage", text: "I have an injury"),
    EmergencyMessage(image: "shield.slash", text: "I have been robbed"),
    EmergencyMessage(image: "hand.raised.slash", text: "I have been assaulted"),
    EmergencyMessage(image: "medical.thermometer", text: "I have felt sick"),
    EmergencyMessage(image: "mappin.and.ellipse", text: "I am lost"),
]
