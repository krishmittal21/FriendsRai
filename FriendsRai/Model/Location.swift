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
    
    var verifiedLocations: [Location] {
        switch self {
        case .hospital:
            return verifiedHospitals
        case .vets:
            return verifiedVets
        }
    }
    
    var image: String {
        switch self {
        case .hospital:
            return "cross.case"
        case .vets:
            return "dog"
        }
    }
    
    var color: Color {
        switch self {
        case .hospital:
            return .red
        case .vets:
            return .orange
        }
    }
    
}

let verifiedHospitals: [Location] = [
    Location(name: "Bhagwati Hospital", latitude: 28.719325823870985, longitude: 77.12957754641101),
    Location(name: "Fortis Hospital", latitude: 28.710401217933416 , longitude: 77.17005279248087)
]

let verifiedVets: [Location] = [
    Location(name: "Vetic Pet Clinic", latitude: 28.696514079161542, longitude: 77.11940313534282)
]
