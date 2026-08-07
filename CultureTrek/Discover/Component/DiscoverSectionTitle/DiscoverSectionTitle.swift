//
//  DiscoverSectonTitle.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI

struct DiscoverSectionTitle: View {
    
    let icon : Image
    let sectionHasIcon : Bool
    
    let sectionTitle : String
    
    var body: some View {
        HStack(spacing : Styles.sectionTitleSpacing) {
            
            HStack(spacing : Styles.sectionIconSpacing) {
                
                if sectionHasIcon {
                    icon
                        .font(.system(size: 24, weight: .heavy))
                }
                
                UISectionTitleFontStyle(content: sectionTitle.uppercased(), size: 24, weight: .heavy, width: .condensed, foreground: Styles.sectionTitleForeground)
                    .frame(maxHeight: 32)
            }
            
            Styles.sectionTitleIcon
                .font(.system(size: 18, weight: .heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

fileprivate struct Styles {
    
    static let sectionTitleForeground = AppColor.Label.primary
    
    static let sectionTitleSpacing = AppToken.Primitive.spacing2
    static let sectionIconSpacing = AppToken.Primitive.spacing0_5
    
    static let sectionTitleIcon = AppImage.Icon.trekSectionForward.image
    
}

#Preview {
    DiscoverSectionTitle(icon: AppImage.Icon.trekLiked.image, sectionHasIcon: true, sectionTitle: "Favoris")
}
