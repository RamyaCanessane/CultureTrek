//
//  TrekFinishedScene.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedScene: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                TrekFinishedIcon()
                
                TrekFinishedTitleParagraphSection(title: "Félicitations",
                                                  paragraph: "Mission accomplie ! Tu as percé tous les mystères de ce parcours.")
                .padding(.horizontal)
                
                TrekFinishedColInfoRow(duration: Duration.seconds(2 * 3600 + 45 * 60 + 17),
                                       points: 456,
                                       rank: (current: 42, total: 154))
                
                LevelWithProgressBar(newPoints: 456,
                                     currentPoints: 320,
                                     totalPoints: 1_000,
                                     currentLevel: "Bois",
                                     nextLevel: "Pierre")
                .padding(.horizontal)
                
                Button("Voir le parcours", action: {})
                    .buttonStyle(.neubrutHero(icon: AppImage.Icon.trekFinishedMapPattern.image,
                                              kind: .neutral))
                    .padding(.horizontal)
                
                TrekFinishedBadgeListSection(badges: Badge.examples)
                    .padding(.horizontal)
                
                TrekFinishedPhotoListSection(photos: [
                    AppImage.riddleTestPicture,
                    AppImage.riddleTestPicture,
                    AppImage.riddleTestPicture,
                    AppImage.riddleTestPicture,
                    AppImage.riddleTestPicture
                ])
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Styles.background)
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.background
    
    static let vSpacing = AppToken.Primitive.spacing8
}

#Preview {
    TrekFinishedScene()
}
