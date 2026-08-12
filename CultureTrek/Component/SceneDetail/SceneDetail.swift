//
//  SceneDetail.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct SceneDetail<Content: View>: View {
    
    let trek : Trek
    
    @ViewBuilder var content: () -> Content?
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: Styles.contentSpacing) {
                
                TrekDetailImageHeader(trek: trek)
                
                TrekDetailHeader(trek: trek)
                
                if let hasContent = content() {
                    
                    hasContent
                    
                }
                
            }
            
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
        .background(Styles.pageBackground)
        .safeAreaBar(edge: .top) {
            
            TrekDetailActionBar(trek: trek)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let pageBackground = AppColor.Page.background
    
    static let contentSpacing = AppToken.Primitive.spacing0
    
}

#Preview {
    SceneDetail(trek: Trek.example) {
        
        TrekDetailSections(trek: Trek.example)
    }
}
