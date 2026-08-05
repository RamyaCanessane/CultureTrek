//
//  TrekFinishedBadgeListSection.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedBadgeListSection: View {
    let badges: [Badge]
    
    private let columns = [
        GridItem(.adaptive(minimum: Styles.maxWidth),
                 spacing: Styles.hSpacing,
                 alignment: .top)
    ]
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            TrekFinishedSectionTitle("Badges obtenus")
            
            LazyVGrid(columns: columns,
                      spacing: Styles.hSpacing) {
                ForEach(badges) { badge in
                    BadgeView(badge)
                }
            }
        }
               .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate struct BadgeView: View {
    let badge: Badge
    
    init(_ badge: Badge) {
        self.badge = badge
    }
    
    var body: some View {
        VStack(spacing: Styles.vSpacing) {
            badge.icon
                .resizable()
                .scaledToFit()
                .frame(width: Styles.badgeIconSize,
                       height: Styles.badgeIconSize)
            
            Text(badge.name)
                .font(Styles.badgeLabelFont)
                .foregroundStyle(Styles.badgeLabelColor)
                .multilineTextAlignment(Styles.badgeLabelAlignment)
                .lineLimit(2)
        }
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing2
    static let hSpacing = AppToken.Primitive.spacing3
    static let maxWidth: Double = 120
    
    static let badgeIconSize: Double = 56
    static let badgeLabelFont: Font = .spaceGrotesk(size: 15,
                                                    weight: .medium)
    static let badgeLabelColor = AppColor.Label.primary
    static let badgeLabelAlignment: TextAlignment = .center
}

#Preview {
    TrekFinishedBadgeListSection(badges: Badge.examples)
        .padding(.vertical)
        .background(AppColor.background)
}
