//
//  CompletedTrekDetailCompletionData.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailCompletionData: View {
    
    let trek : Trek
    let kind : String
    let icon : Image?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.detailSpacing){
            
            UITitle(
                content: kind.uppercased(),
                size: Styles.detailTitleFontSize,
                weight: .heavy,
                width: .condensed,
                foreground: Styles.detailForeground
            )
            
            SingleCompletionData(trek: trek, kind: kind.capitalized, icon: icon)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let detailForeground = AppColor.Label.primary
    
    static let detailSpacing = AppToken.Primitive.padding1 + AppToken.Primitive.padding1 / 2
    
    static let detailTitleFontSize = CGFloat(14)
    
}
#Preview {
    CompletedTrekDetailCompletionData(trek: Trek.example, kind: "durée du parcours".capitalized, icon: CompletedTrekDetailInfoViewModel().durationSection.icon)
}
