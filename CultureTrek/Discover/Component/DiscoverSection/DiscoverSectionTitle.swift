//
//  DiscoverSectonTitle.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI

struct DiscoverSectionTitle: View {
    
    var icon : Image?
    let title : String
    
    var body: some View {
        HStack(spacing : Styles.sectionTitleSpacing) {
            
            HStack(spacing : Styles.sectionIconSpacing) {
                
                if let hasIcon = icon {
                    hasIcon
                        .font(.system(size: Styles.sectionLabelFontSize, weight: .heavy))
                }
                
                UITitle(content: title.uppercased(), size: Styles.sectionLabelFontSize, weight: .heavy, width: .condensed, foreground: Styles.sectionTitleForeground)
            }
            
            Styles.sectionTitleIcon
                .font(.system(size: 18, weight: .heavy))
            
        }
        .foregroundStyle(Styles.sectionTitleForeground)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Styles.sectionTitleHorizontalPadding)
    }
}

fileprivate struct Styles {
    
    static let sectionTitleForeground = AppColor.Label.primary
    
    static let sectionTitleHorizontalPadding = AppToken.Primitive.spacing4
    static let sectionTitleSpacing = AppToken.Primitive.spacing2
    static let sectionIconSpacing = AppToken.Primitive.spacing0_5
    
    static let sectionTitleIcon = AppImage.Icon.trekSectionForward.image
    static let sectionLabelFontSize = CGFloat(24)
    
}

#Preview {
    DiscoverSectionTitle(icon: AppImage.Icon.trekLiked.image, title: "Favoris")
}
