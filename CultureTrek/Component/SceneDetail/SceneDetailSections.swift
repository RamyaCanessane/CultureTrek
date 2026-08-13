//
//  SceneDetailSections.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct SceneDetailSections<Content: View>: View {
    
    let trek : Trek
    
    @ViewBuilder var content: () -> Content?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.detailSectionsSpacing ){
            
            if let hasContent = content() {
                
                hasContent
                
            }
            
        }
        .padding(.horizontal, Styles.detailSectionsHorizontalPadding)
        .padding(.vertical, Styles.detailSectionsVerticalPadding)
        
    }
}

fileprivate struct Styles {
    
    static let detailSectionsSpacing = AppToken.Primitive.spacing8
    static let detailSectionsVerticalPadding = AppToken.Primitive.spacing8
    static let detailSectionsHorizontalPadding = AppToken.Primitive.spacing4
    
}

#Preview {
    SceneDetailSections(trek: Trek.example) {
            
            TrekDetailInfo(trek: Trek.example)
            
            TrekDetailText(title: "Objectif", article: Trek.example.goal)
            
            TrekDetailText(title: "Description", article: Trek.example.summary)
            
            TrekDetailAccessibility(trek: Trek.example)
            
            TrekDetailGTK(goodToKnow: Trek.example.goodToKnow)
            
        TrekDetailBadge(trek: Trek.example)
                .grayscale(1)
    }
}
