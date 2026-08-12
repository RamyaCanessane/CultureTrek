//
//  TrekDetailBadgeDisplay.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import SwiftUI

struct SingleBadgeContent: View {
    
    let badge : Image
    let name : String
    
    var body: some View {
        
        VStack(spacing: Styles.badgeContentSpacing) {
            
            badge
                .resizable()
                .scaledToFit()
                .frame(width: Styles.badgeIconSize, height: Styles.badgeIconSize)
                .grayscale(1)
            
            Text(name)
                .font(.spaceGrotesk(size: Styles.badgeLabelFontSize, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(maxWidth: Styles.badgeLabelWidth)
        }
        .foregroundStyle(Styles.badgeLabelForeground)
        
    }
}

fileprivate struct Styles {
    
    static let badgeLabelForeground = AppColor.Label.primary
    
    static let badgeContentSpacing = AppToken.Primitive.padding2
    
    static let badgeIconSize = CGFloat(56)
    
    static let badgeLabelWidth = CGFloat(80)
    static let badgeLabelFontSize = CGFloat(17)
    
}

#Preview {
    SingleBadgeContent(badge: Trek.example.badgesToUnlock[0].icon, name: Trek.example.badgesToUnlock[0].name)
}
