//
//  TrekListHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListHeader: View {
    
    let icon : Image?
    let title : String
    
    var body: some View {
        
        HStack(spacing: Styles.headerIconSpacing){
            
            if let hasIcon = icon {
                hasIcon
                    .font(.system(size: Styles.headerFontSize, weight: .black))
            }
            
            UITitleFontStyle(content: title.uppercased(), size: Styles.headerFontSize, weight: .black, width: .condensed, foreground: Styles.headerForeground)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Styles.headerHorizontalPadding)
        
    }
}

fileprivate struct Styles {
    
    static let headerHorizontalPadding = AppToken.Primitive.padding4
    
    static let headerIconSpacing = AppToken.Primitive.spacing0_5
    static let headerForeground = AppColor.Label.primary
    
    static let headerFontSize = CGFloat(40)
    
}

#Preview {
    TrekListHeader(icon: AppImage.Icon.trekLiked.image, title: "Tes favoris")
}
