//
//  MapsView.swift
//  FriendsRai
//
//  Created by Krish Mittal on 01/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $position) {
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView()
}
