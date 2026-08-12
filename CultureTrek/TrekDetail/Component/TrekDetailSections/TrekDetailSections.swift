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
            
            TrekDetailBadge(trek: trek)
                .grayscale(1)
            
        }
        
    }
}

#Preview {
    ScrollView{
        TrekDetailSections(trek: Trek.example)
    }
}
