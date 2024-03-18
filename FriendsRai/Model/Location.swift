//
//  Locations.swift
//  FriendsRai
//
//  Created by Krish Mittal on 12/03/24.
//

import SwiftUI

struct Location:Hashable {
    let name: String
    let latitude: Float
    let longitude: Float
}

enum LocationType:CaseIterable {
    case hospital
    case vets
    case therapists
    case police
    
    var name: String {
        switch self {
            
        case .hospital:
            "Hospital"
        case .vets:
            "Vets"
        case .therapists:
            "Therapy"
        case .police:
            "Police"
        }
    }
    var verifiedLocations: [Location] {
        switch self {
        case .hospital:
            return verifiedHospitals
        case .vets:
            return verifiedVets
        case .therapists:
            return verifiedTherapists
        case .police:
            return verifiedPoliceStations
        }
    }
    
    var image: String {
        switch self {
        case .hospital:
            return "cross.case"
        case .vets:
            return "pawprint"
        case .therapists:
            return "heart.text.square"
        case .police:
            return "shield"
        }
    }
    
    var color: Color {
        switch self {
        case .hospital:
            return .red
        case .vets:
            return .orange
        case .therapists:
            return .blue
        case .police:
            return .green
        }
    
    }
}


let verifiedHospitals: [Location] = [
    Location(name: "Bhagwati Hospital", latitude: 28.71926480610643, longitude: 77.12950244480241),
    Location(name: "Fortis Hospital", latitude: 28.711235788509956 , longitude: 77.16990040276387),
    Location(name: "All India Institute of Medical Sciences (AIIMS)", latitude: 28.567657222137118, longitude: 77.21568000614438),
    Location(name: "Sir Ganga Ram Hospital", latitude: 28.63987961002454, longitude: 77.18966389144356),
    Location(name: "Apollo Hospital", latitude: 28.672567417090455, longitude: 77.13443184356466)
]

let verifiedVets: [Location] = [
    Location(name: "Vetic Pet Clinic", latitude: 28.667672426901532, longitude: 77.10087204440879),
    Location(name: "Pet Care Hospital", latitude: 28.58630683506611, longitude: 77.07211876377833)
]

let verifiedTherapists: [Location] = [
    Location(name: "MindCare Clinic", latitude: 28.67411477469781, longitude: 77.11163469770028)
]

let verifiedPoliceStations: [Location] = [
    Location(name: "Prashant Vihar Police Station", latitude: 28.71809311263269, longitude: 77.12725216657195),
    Location(name: "Chanakyapuri Police Station", latitude: 28.606551124703596, longitude: 77.1961134876067),
    Location(name: "Kalkaji Police Station", latitude: 28.550473402661193, longitude: 77.25670995369194),
    Location(name: "Saket Police Station", latitude: 28.529361143767613, longitude: 77.21705617555786)
]
