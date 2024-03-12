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
    @State private var selectedLocationType: LocationType? = nil
    
    var body: some View {
        Map(position: $position) {
            
            UserAnnotation()
            
            if let selectedType = selectedLocationType {
                ForEach(selectedType.verifiedLocations, id: \.self) { location in
                    Marker(location.name, systemImage: selectedType.image, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude), longitude: CLLocationDegrees(location.longitude)))
                        .tint(selectedType.color)
                }
            } else {
                ForEach(LocationType.allCases, id: \.self) { locationType in
                    ForEach(locationType.verifiedLocations, id: \.self) { location in
                        Marker(location.name, systemImage: locationType.image, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude), longitude: CLLocationDegrees(location.longitude)))
                            .tint(locationType.color)
                    }
                }
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .safeAreaInset(edge: .bottom) {
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        ForEach(LocationType.allCases, id: \.self) { locationType in
                            Button(action: {
                                self.selectedLocationType = locationType
                            }) {
                                Image(systemName: locationType.image)
                                    .foregroundColor(locationType == selectedLocationType ? .white : Color.blackColor)
                                    .font(.subheadline)
                                    .padding()
                                    .background(locationType == selectedLocationType ? locationType.color.opacity(0.8) : .white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        
        .onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapView()
}
