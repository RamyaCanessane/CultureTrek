//
//  CompletedTrekDetailSections.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailSections: View {
    
    let trek : Trek
    
    var body: some View {
        
        SceneDetailSections(trek: trek) {
            
            CompletedTrekDetailDate(trek: trek)
            
            CompletedTrekDetailInfo(trek: trek)
            
            CompletedTrekDetailPhotos(trek: trek)
            
            CompletedTrekDetailBadge(trek: trek)
            
        }
        
    }
}

#Preview {
    CompletedTrekDetailSections(trek: Trek.example)
}
