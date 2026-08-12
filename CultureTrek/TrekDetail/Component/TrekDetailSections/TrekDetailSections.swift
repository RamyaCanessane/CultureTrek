//
//  TrekDetailSections.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailSections: View {
    
    let trek : Trek
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Styles.detailSectionsSpacing ){
            
            TrekDetailInfo(trek: trek)
            
            TrekDetailText(title: "Objectif", article: trek.goal)
            
            TrekDetailText(title: "Description", article: trek.summary)
            
            TrekDetailAccessibility(trek: trek)
            
            TrekDetailGTK(goodToKnow: trek.goodToKnow)
            
            TrekDetailBadge(trek: trek)
            
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
    ScrollView{
        TrekDetailSections(trek: Trek.example)
    }
}
