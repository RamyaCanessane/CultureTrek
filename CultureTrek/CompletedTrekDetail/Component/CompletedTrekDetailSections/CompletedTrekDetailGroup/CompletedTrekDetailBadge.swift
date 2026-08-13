//
//  CompletedTrekDetailBadge.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI
import PopupView

struct CompletedTrekDetailBadge: View {
    
    let trek : Trek
    
    let title : String = "Badges obtenus"
    
    @State private var selectedBadge : Badge?
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            HStack(alignment: .top, spacing: Styles.badgeInfoSpacing) {
                
                if let hasBadge = trek.completion?.unlockedBadges {
                    
                    ForEach(hasBadge){ badge in
                        
                        SingleBadgeContent(
                            badge: badge.icon,
                            name: badge.name
                        )
                        .onTapGesture {
                            selectedBadge = badge
                        }
                        
                    }
                    
                } else {
                    
                    Text("Pas de badge")
                        .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .regular))
                        .foregroundStyle(Styles.detailForeground)
                    
                }
                
            }
            .padding(.top, Styles.badgeInfoPaddingTop)
            
        }
        .popup(item: $selectedBadge) { badge in
            BadgePopupView(badge: badge)
        } customize: {
            $0
                .closeOnTap(true)
                .closeOnTapOutside(true)
                .backgroundColor(Color.black.opacity(0.32))
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
