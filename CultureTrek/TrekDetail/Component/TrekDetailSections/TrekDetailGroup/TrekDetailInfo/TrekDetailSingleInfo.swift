//
//  TrekDetailSingleInfo.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailSingleInfo: View {
    
    let trek : Trek
    let kind : String
    let icon : Image?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.infoSpacing){
            
            UITitle(
<<<<<<< HEAD:CultureTrek/TrekDetail/Component/TrekDetailSections/TrekDetailInfo/TrekDetailSingleInfo.swift
                content: kind.rawValue.uppercased(),
=======
                content: kind.uppercased(),
>>>>>>> 1a623d16885c6e44e6485743d1a03431c43d2c2f:CultureTrek/TrekDetail/Component/TrekDetailSections/TrekDetailGroup/TrekDetailInfo/TrekDetailSingleInfo.swift
                size: Styles.infoTitleFontSize,
                weight: .heavy,
                width: .condensed,
                foreground: Styles.infoForeground
            )
            
            SingleInfoContent(trek: trek, kind: kind.capitalized, icon: icon)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let infoForeground = AppColor.Label.primary
    
    static let infoSpacing = AppToken.Primitive.padding1 + AppToken.Primitive.padding1 / 2
    
    static let infoTitleFontSize = CGFloat(14)
    
}

#Preview {
    TrekDetailSingleInfo(trek: Trek.example, kind: "énigmes".capitalized, icon: TrekDetailInfoViewModel().riddlesSection.icon)
}
