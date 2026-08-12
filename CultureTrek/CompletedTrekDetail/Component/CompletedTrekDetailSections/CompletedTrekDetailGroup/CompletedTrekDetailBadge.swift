//
//  CompletedTrekDetailBadge.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailBadge: View {
    
    let trek : Trek
    
    let title : String = "Badges obtenus"
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            HStack(alignment: .top, spacing: Styles.badgeInfoSpacing) {
                
                if let hasBadge = trek.completion?.unlockedBadges {
                    
                    ForEach(hasBadge){ badge in
                        
                        SingleBadgeContent(
                            badge: badge.icon,
                            name: badge.name
                        )
                        
                    }
                    
                } else {
                    
                    Text("Pas de badges")
                        .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .regular))
                        .foregroundStyle(Styles.detailForeground)
                    
                }
                
            }
            .padding(.top, Styles.badgeInfoPaddingTop)
            
        }
        
        
    }
}

fileprivate struct Styles {
    
    static let detailForeground = AppColor.Label.primary
    
    static let badgeInfoSpacing = AppToken.Primitive.padding6
    static let badgeInfoPaddingTop = AppToken.Primitive.padding1
    
    static let detailFontSize = CGFloat(17)
    
}

#Preview {
    CompletedTrekDetailBadge(trek: Trek.example)
}
