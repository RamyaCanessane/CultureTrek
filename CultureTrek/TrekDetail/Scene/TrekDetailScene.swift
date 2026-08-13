//
//  TrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 13/08/2026.
//

import SwiftUI

struct TrekDetailScene: View {
    
    let trek : Trek
    @State var trekIsCompleted: Bool = true
    
    @Environment(TrekStore.self) private var trekStore
    
    var body: some View {
        Group {
            if trek.isCompleted {
                CompletedTrekDetailScene(trek: trek)
                    .frame(maxWidth: .infinity)
            } else {
                TrekDetailUncompletedScene(trek: trek)
            }
        }
        .onAppear {
            trekIsCompleted = trek.isCompleted
        }
        .onDisappear {
            if trek.isCompleted && !trekIsCompleted {
                trekStore.addTrekToHistory(trek)
            }
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
