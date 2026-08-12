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
        
        if let hasArticle = article {
            
            SceneDetailGroup(title: title) {
                
                Text("""
            \(hasArticle)
            """)
                .font(.spaceGrotesk(size: Styles.detailArticleFontSize, weight: .regular))
                .multilineTextAlignment(.leading)
                
            }
        }
        
    }
}

fileprivate struct Styles {
    
    static let detailArticleFontSize = CGFloat(17)
    
}

#Preview {
    TrekDetailText(title: "Objectif", article: Trek.example.goal)
}
