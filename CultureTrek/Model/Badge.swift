//
//  Badge.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct Badge: Identifiable {
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
