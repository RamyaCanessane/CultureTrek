//
//  ProfileScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI
import MapKit

struct ProfileScene: View {
    @Environment(\.dismiss) private var dismiss
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ProfileCard(firstName: user.firstName, lastName: user.lastName, initials: user.getNameInitials(), points: user.currentXPPoints)
                ProfileLocalisationCard(coordinates: user.coordinate, initials: user.getNameInitials())
            }
        }
        .padding(16)
        .background(AppColor.Page.background)
        .scrollBounceBehavior(.basedOnSize)
        .sceneHeader("Profil", onDismiss: {dismiss()})
        .foregroundStyle(AppColor.Label.primary)
    }
}

#Preview {
    ProfileScene(user: User(
        coordinate: CLLocationCoordinate2D(latitude: 48.848222, longitude: 2.395925),
        currentXPPoints: 2100,
        firstName: "Camille",
        lastName: "Sawada",
        picture: Image(""))
    )
}
