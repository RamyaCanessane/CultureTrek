//
//  CompletedTrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailScene: View {
    
    let trek : Trek
    
    @State private var state: TabState = .first
    
    enum PickerTab : String {
        case summary = "Résumé"
        case info = "Infos"
    }
        
    var body: some View {
        
        SceneDetail(trek: trek) {
            
            VStack {
                NeubrutTabPicker(nameFirstTab: PickerTab.summary.rawValue, nameSecondTab: PickerTab.info.rawValue, state: $state)
                
                if state == .first {
                    
                    //CompletedTrekDetail
                    
                } else {
                    
                    TrekDetailSections(trek: trek)
                    
                }
                
            }
            
        }
        
    }
}


#Preview {
    CompletedTrekDetailScene(trek: Trek.example)
}
