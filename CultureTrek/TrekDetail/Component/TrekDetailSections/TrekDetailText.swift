//
//  TrekDetailTextSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailText: View {
    
    let title : String
    let article : String?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.detailSpacing) {
            
            if let hasArticle = article {
                UITitleFontStyle(content: title, size: Styles.detailTitleFontSize, weight: .heavy, width: .condensed, foreground: Styles.detailForeground)
                
                Text("""
                \(hasArticle)
                """)
                .font(.spaceGrotesk(size: Styles.detailArticleFontSize, weight: .regular))
                .multilineTextAlignment(.leading)
            }
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

fileprivate struct Styles {
    
    static let detailTitleFontSize = CGFloat(20)
    static let detailArticleFontSize = CGFloat(17)
    
    static let detailForeground = AppColor.Label.primary
    
    static let detailSpacing = AppToken.Primitive.padding1
    
}

#Preview {
    TrekDetailText(title: "Objectif", article: Trek.example.goal)
}
