//
//  TrekListHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListLabel: View {
    
    let icon : Image?
    let title : String
    
    var body: some View {
        
        HStack(spacing: Styles.labelIconSpacing){
            
            if let hasIcon = icon {
                hasIcon
                    .font(.system(size: Styles.labelFontSize, weight: .black))
            }
            
            UITitleFontStyle(content: title.uppercased(), size: Styles.labelFontSize, weight: .black, width: .condensed, foreground: Styles.labelForeground)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

fileprivate struct Styles {
    
    static let labelIconSpacing = AppToken.Primitive.spacing0_5
    static let labelForeground = AppColor.Label.primary
    
    static let labelFontSize = CGFloat(40)
    
}

#Preview {
    TrekListLabel(icon: AppImage.Icon.trekLiked.image, title: "Tes favoris")
}
