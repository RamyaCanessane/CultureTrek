//
//  TrekDetailGroup.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import SwiftUI

struct TrekDetailGroup<Content: View>: View {
    
    let title : String
    
    @ViewBuilder var content: () -> Content?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.detailSpacing) {
            
            if let hasContent = content() {
                UITitle(content: title.uppercased(), size: Styles.detailTitleFontSize, weight: .heavy, width: .condensed, foreground: Styles.detailForeground)
                
                hasContent
            }
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

fileprivate struct Styles {
    
    static let detailTitleFontSize = CGFloat(20)
    
    static let detailForeground = AppColor.Label.primary
    
    static let detailSpacing = AppToken.Primitive.padding1
    
}

#Preview {
    TrekDetailGroup(title: "Description", content: { })
}
