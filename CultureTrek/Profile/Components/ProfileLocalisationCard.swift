//
//  ProfileLocalisationCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI
import _LocationEssentials

struct ProfileLocalisationCard: View {
    let coordinates: CLLocationCoordinate2D
    let initials: String
    
    var body: some View {
            ZStack(alignment: .topLeading) {
                ProfileMap(coordinates: coordinates, initials: initials)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                            .fill(AppColor.accentNeutral)
                            .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
                    )
                    .padding(.top, 20)

                ProfileTitleCard()
                    .padding(.leading, 16)
            }
    }
}

#Preview {
    ProfileLocalisationCard(coordinates: CLLocationCoordinate2D(latitude: 48.848222, longitude: 2.395925), initials: "RC")
        .padding(16)
}
