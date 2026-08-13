//
//  CompletedTrekDetailFooter.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailFooter: View {
    
    @Binding var showRiddleFullScreen : Bool
    @Binding var showQuizFullScreen : Bool
    @Binding var showMapFullScreen : Bool
    
    var body: some View {
        
        HStack(spacing: Styles.footerSpacing){
            
            Button("Énigmes") {
                
                showRiddleFullScreen = true
                
            }
            .buttonStyle(NeubrutProminentButtonStyle(kind: .primary, icon: nil, isFullWidth: true))
            .disabled(true)
            
            Button("Quiz") {
                
                showQuizFullScreen = true
                
            }
            .buttonStyle(NeubrutProminentButtonStyle(kind: .neutral, icon: nil, isFullWidth: true))
            
            Button(action: {
                
                showMapFullScreen = true
                
            }) {
                AppImage.Icon.map.image
            }
            .buttonStyle(.neubrutIcon(kind: .secondary))
            
        }
        .padding(Styles.footerPadding)
        
    }
}

fileprivate struct Styles {
    
    static let footerSpacing = AppToken.Primitive.spacing3
    static let footerPadding = AppToken.Primitive.padding4
    
}

#Preview {
    CompletedTrekDetailFooter(showRiddleFullScreen: .constant(false), showQuizFullScreen: .constant(false), showMapFullScreen: .constant(false))
}
