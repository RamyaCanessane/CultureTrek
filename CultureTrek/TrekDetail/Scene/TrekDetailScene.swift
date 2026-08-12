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
        ScrollView{
            
            VStack(spacing: Styles.contentSpacing){
                
                TrekDetailImageHeader(trek: trek)
                
                TrekDetailHeader(trek: trek)
                
                TrekDetailSections(trek: trek)
                
            }
            
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
        .background(Styles.pageBackground)
        .safeAreaBar(edge: .top) {
            
            TrekDetailActionBar(trek: trek)
            
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
    
    static let pageBackground = AppColor.Page.background
    
    static let contentSpacing = AppToken.Primitive.spacing0
    
    static let buttonPadding = AppToken.Primitive.padding4
    
}

#Preview {
    TrekDetailScene(trek: Trek.example)
}
