//
//  TrekDetailSingleInfo.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailSingleInfo: View {
    
    let trek : Trek
    let kind : TrekDetailInfoContent
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.infoSpacing){
            
            UITitleFontStyle(
                content: kind.rawValue.uppercased(),
                size: Styles.infoTitleFontSize,
                weight: .heavy,
                width: .condensed,
                foreground: Styles.infoForeground
            )
            
            SingleInfoContent(trek: trek, kind: kind)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let infoForeground = AppColor.Label.primary
    
    static let infoSpacing = AppToken.Primitive.padding1 + AppToken.Primitive.padding1 / 2
    
    static let infoTitleFontSize = CGFloat(14)
    
}

#Preview {
    TrekDetailSingleInfo(trek: Trek.example, kind: .distance)
}
