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
        
        SceneDetailSections(trek: trek){
            
            TrekDetailInfo(trek: trek)
            
            TrekDetailText(title: "Objectif", article: trek.goal)
            
            TrekDetailText(title: "Description", article: trek.summary)
            
            TrekDetailAccessibility(trek: trek)
            
            TrekDetailGTK(goodToKnow: trek.goodToKnow)
            
            TrekDetailBadge(trek: trek, title: trek.isCompleted ? "Badges obtenus" : "Badges à obtenir")
                .grayscale(trek.isCompleted ? 0 : 1)
            
            Spacer(minLength: Styles.detailBottomPadding)
            
        }
        .foregroundStyle(Styles.textForeground)
        
    }
}

fileprivate struct Styles {
    
    static let textForeground = AppColor.Label.primary
    static let detailBottomPadding = AppToken.Primitive.padding20
    
}

#Preview {
    ScrollView{
        TrekDetailSections(trek: Trek.example)
    }
}
