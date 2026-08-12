//
//  TrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct TrekDetailScene: View {
    
    let trek : Trek
    
    @State private var showFullScreenCover = false
    
    var body: some View {
        
        SceneDetail(trek: trek) {
            
            TrekDetailSections(trek: trek)
            
        }
        .sceneFooter {
            Button("Commencer") {
                
                showFullScreenCover = true
                
            }
            .buttonStyle(NeubrutProminentButtonStyle(kind: .primary, icon: nil, isFullWidth: true))
            .padding(Styles.buttonPadding)
            
        }
        .fullScreenCover(isPresented: $showFullScreenCover) {
            
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let buttonPadding = AppToken.Primitive.padding4
    
}

#Preview {
    TrekDetailScene(trek: Trek.example)
}
