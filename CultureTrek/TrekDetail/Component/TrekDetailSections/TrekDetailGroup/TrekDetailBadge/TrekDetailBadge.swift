//
//  TrekDetailBadgeSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI
import PopupView

struct TrekDetailBadge: View {
    
    let trek : Trek
    
    let title : String
    
    @State private var selectedBadge : Badge?
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            ScrollView(.horizontal) {
                
                HStack(alignment: .top, spacing: Styles.badgeInfoSpacing) {
                    
                    ForEach(trek.completion?.unlockedBadges ?? trek.badgesToUnlock){ badge in
                        
                        SingleBadgeContent(
                            badge: badge.icon,
                            name: badge.name
                        )
                        .onTapGesture {
                            selectedBadge = badge
                        }
                        
                    }
                    
                }
                .padding(.top, Styles.badgeInfoPaddingTop)
                
            }
        }
        .scrollIndicators(.hidden)
        .popup(item: $selectedBadge) { badge in
            BadgePopupView(obtained: trek.isCompleted, badge: badge)
        } customize: {
            $0
                .closeOnTap(true)
                .closeOnTapOutside(true)
                .backgroundColor(Color.black.opacity(0.32))
        }
        
        
    }
}

fileprivate struct Styles {
    
    static let badgeInfoSpacing = AppToken.Primitive.padding6
    static let badgeInfoPaddingTop = AppToken.Primitive.padding1
    
}

#Preview {
    TrekDetailBadge(trek: Trek.example, title: "Badges à obtenir")
}
