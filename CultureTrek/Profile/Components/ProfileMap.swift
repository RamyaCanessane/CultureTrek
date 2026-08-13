//
//  ProfileMap.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI
import MapKit

struct ProfileMap: View {
    let coordinates: CLLocationCoordinate2D
    let initials: String
    
    @State private var position: MapCameraPosition
    
    init(coordinates: CLLocationCoordinate2D, initials: String) {
        self.coordinates = coordinates
        self.initials = initials
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        _position = State(initialValue: .region(region))
    }
    
    var body: some View {
        Map(position: $position, interactionModes: []) {
            Annotation("", coordinate: coordinates) {
                Text(initials)
                    .font(.spaceGrotesk(size: 24, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                            .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                            .background(AppColor.accentPrimary)
                            .frame(width: 52, height: 52)
                    )
            }
        }
    }
}

#Preview {
    ProfileMap(coordinates: CLLocationCoordinate2D(latitude: 48.848222, longitude: 2.395925), initials: "RC")
}
