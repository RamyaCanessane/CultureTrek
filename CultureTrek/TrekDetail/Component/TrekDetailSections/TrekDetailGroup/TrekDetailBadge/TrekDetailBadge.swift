//
//  TrekDetailBadgeSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailBadge: View {
    
    let trek : Trek
    
    let title : String = "Badges à obtenir"
    
    var body: some View {
        
        TrekDetailGroup(title: title.uppercased()) {
            
            HStack(alignment: .top, spacing: Styles.badgeInfoSpacing) {
                
                ForEach(trek.badgesToUnlock){ badge in
                    
                    SingleBadgeContent(
                        badge: badge.icon,
                        name: badge.name
                    )
                    
                }
                
            }
            .padding(.top, Styles.badgeInfoPaddingTop)
            
        }
        
        
    }
}

fileprivate struct Styles {
    
    static let badgeInfoSpacing = AppToken.Primitive.padding6
    static let badgeInfoPaddingTop = AppToken.Primitive.padding1
    
}

#Preview {
    TrekDetailBadge(trek: Trek.example)
}
