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
                .frame(width: .infinity)
            
        } else {
            
            TrekDetailUncompletedScene(trek: trek)
            
        }
    }
    
}

#Preview {
    let trekStore: TrekStore = .init(treks: Trek.liveDemoExamples)
    let appStore: AppStore = .init(user: User.liveDemoExample)
    
    TrekDetailScene(trek: trekStore.treks.first!)
        .environment(trekStore)
        .environment(appStore)
}
