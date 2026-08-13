//
//  TrekDetailUncompletedScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct TrekDetailUncompletedScene: View {
    
    let trek : Trek
    
    @State private var showFullScreenCover = false
    
    @Environment(AppStore.self) private var appStore
    
    var body: some View {
        
        SceneDetail(trek: trek) {
            
            TrekDetailSections(trek: trek)
            
        }
        .sceneFooter {
            Button("Commencer") {
                
                showFullScreenCover = true
                
                print(trek.completion)
            }
            .buttonStyle(NeubrutProminentButtonStyle(kind: .primary, icon: nil, isFullWidth: true))
            .padding(Styles.buttonPadding)
            
        }
        .fullScreenCover(isPresented: $showFullScreenCover,
                         onDismiss: {
            print(trek.completion)
        }) {
            RiddleFlowScene(trek: trek,
                            user: appStore.user)
        }
        .neubrutTabViewVisibility(.hidden)
        
    }
}

fileprivate struct Styles {
    
    static let buttonPadding = AppToken.Primitive.padding4
    
}

#Preview {
    let trekStore: TrekStore = .init(treks: Trek.liveDemoExamples)
    let appStore: AppStore = .init(user: User.liveDemoExample)
    
    TrekDetailUncompletedScene(trek: trekStore.treks.first!)
        .environment(trekStore)
        .environment(appStore)
}
