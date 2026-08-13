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
            
            TrekDetailBadge(trek: trek, title: "Badges obtenus")
            
            Spacer(minLength: Styles.detailBottomPadding)
        }
        
    }
}


fileprivate struct Styles {
    
    static let detailBottomPadding = AppToken.Primitive.padding20
    
}


#Preview {
    CompletedTrekDetailSections(trek: Trek.example)
}
