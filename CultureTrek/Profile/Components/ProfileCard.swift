//
//  ProfileCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI
import MapKit

struct ProfileCard: View {
    let firstName: String
    let lastName: String
    let initials: String
    let points: UInt
    
    
    var body: some View {
        HStack(spacing: 16) {
            ProfileAvatarCard(initials: initials)

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 1) {
                    Text(firstName)
                        .font(.spaceGrotesk(size: 35, weight: .bold))
                        .minimumScaleFactor(0.6)
                    Text(lastName)
                        .font(.spaceGrotesk(size: 20, weight: .medium))
                        .minimumScaleFactor(0.6)
                        .textCase(.uppercase)
                }
            
                ProfileCurrentXPPoints(currentPoints: points)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                .fill(AppColor.accentNeutral)
                .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
        )
    }
}

#Preview {
    let user = User(
        coordinate: CLLocationCoordinate2D(latitude: 48.848222, longitude: 2.395925),
        currentXPPoints: 2137,
        firstName: "Sébastien",
        lastName: "Mareaux",
        picture: Image("")
    )
    ProfileCard(firstName: user.firstName, lastName: user.lastName, initials: user.getNameInitials(), points: user.currentXPPoints)
        .padding(16)
}
