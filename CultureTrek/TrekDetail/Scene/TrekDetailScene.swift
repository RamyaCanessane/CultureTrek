//
//  TrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 13/08/2026.
//

import SwiftUI

struct TrekDetailScene: View {
    
    let trek : Trek
    
    var body: some View {
        
        if trek.isCompleted {
            
            CompletedTrekDetailScene(trek: trek)
            
        } else {
            
            TrekDetailUncompletedScene(trek: trek)
            
        }
    }
    
}

#Preview {
    TrekDetailScene(trek: Trek.example)
}
