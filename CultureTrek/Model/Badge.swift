//
//  Badge.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct Badge: Identifiable, Equatable {
    let id = UUID()
    let icon: Image
    let name: String
}

extension Badge {
    
    static let examples: [Badge] = [
        .init(icon: AppImage.badgeTest,
              name: "Et consequatur"),
        .init(icon: AppImage.badgeTest,
              name: "Velit dolor"),
        .init(icon: AppImage.badgeTest,
              name: "Iure voluptas velit"),
        .init(icon: AppImage.badgeTest,
              name: "Facilis"),
        .init(icon: AppImage.badgeTest,
              name: "Quia"),
    ]
}

extension Badge {
    
    static let paname = Badge(icon: AppImage.badgeTest,
                              name: "Paname")
    static let water = Badge(icon: AppImage.badgeTest,
                             name: "Au fil de l'eau")
    static let climber = Badge(icon: AppImage.badgeTest,
                               name: "Grimpeur")
    static let marathonRunner = Badge(icon: AppImage.badgeTest,
                                      name: "Marathonien")
    static let investigator = Badge(icon: AppImage.badgeTest,
                                    name: "L'Enquêteur")
    static let withDisabilities = Badge(icon: AppImage.badgeTest,
                                        name: "Accessible à tous")
}
