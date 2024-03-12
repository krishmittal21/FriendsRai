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
            
            ForEach(LocationType.allCases, id: \.self) { locationType in
                ForEach(locationType.verifiedLocations, id: \.self) { location in
                    Marker(location.name, systemImage: locationType.image, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude), longitude: CLLocationDegrees(location.longitude)))
                        .tint(locationType.color)
                }
            }
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
