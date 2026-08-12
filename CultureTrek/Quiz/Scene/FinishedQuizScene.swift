//
//  FinishedQuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 11/08/2026.
//

import SwiftUI

struct FinishedQuizScene: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    ZStack(alignment: .center) {
                        Image(systemName: "checkmark.seal.fill")
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(AppColor.border, AppColor.success)
                            .frame(width: 200, height: 200)
                        Image(systemName: "checkmark.seal")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 200, height: 200)
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity)
                    UITitle(content: "Résulats du quiz", size: 24, weight: .black, width: .condensed, foreground: AppColor.Label.primary)
                    Text("Bien joué ! Tu maîtrises bien le sujet, encore un petit effort pour le sans-faute !")
                        .fontWeight(.semibold)
                    
                    LevelWithProgressBar(newPoints: 30, currentPoints: 40, totalPoints: 100, currentLevel: "Fer", nextLevel: "Bronze")
                    
                    Button {
                        
                    } label: {
                        Text("Réponses aux question")
                    }
                    .buttonStyle(.neubrutProminent(kind: .primary, icon: nil, isFullWidth: true))
                }
                .padding(16)
            }
            .background(AppColor.Page.background)
            .scrollBounceBehavior(.basedOnSize)
            .sceneFooter {
                Button {
                    
                } label: {
                    Text("Fermer le quiz")
                }
                .buttonStyle(.neubrutProminent(kind: .neutral, icon: nil, isFullWidth: true))
            }
        }
    }
}

#Preview {
    FinishedQuizScene()
}
