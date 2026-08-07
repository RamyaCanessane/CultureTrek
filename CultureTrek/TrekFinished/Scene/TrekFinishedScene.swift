//
//  TrekFinishedScene.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct TrekFinishedScene: View {
    let duration: Duration?
    let points: UInt?
    let rank: (current: UInt, total: UInt)?
    let onPressPath: () -> Void
    let onPressStartQuiz: () -> Void
    let onPressSkipQuiz: () -> Void
    
    private let user: User
    private let progressBarData: LevelCalculator.ProgressBarData?
    
    init(duration: Duration?,
         points: UInt?,
         rank: (current: UInt, total: UInt)?,
         onPressPath: @escaping () -> Void,
         onPressStartQuiz: @escaping () -> Void,
         onPressSkipQuiz: @escaping () -> Void) {
        self.duration = duration
        self.points = points
        self.rank = rank
        
        #warning("Utiliser le vrai utilisateur")
        self.user = .init(currentXPPoints: 1100,
                          firstName: "Nanashi",
                          lastName: "Yamada",
                          picture: Image(.riddleTestPicture))
        
        if let points {
            progressBarData = LevelCalculator.getProgressBarData(currentXPPoints: user.currentXPPoints,
                                                                 newXPPoints: points)
        } else {
            progressBarData = nil
        }
        self.onPressPath = onPressPath
        self.onPressStartQuiz = onPressStartQuiz
        self.onPressSkipQuiz = onPressSkipQuiz
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                TrekFinishedIcon()
                
                TrekFinishedTitleParagraphSection(title: "Félicitations",
                                                  paragraph: "Mission accomplie ! Tu as percé tous les mystères de ce parcours.")
                .padding(.horizontal)
                
                if duration != nil || points != nil || rank != nil {
                    TrekFinishedColInfoRow(duration: duration,
                                           points: points,
                                           rank: rank)
                }
                
                if let progressBarData {
                    LevelWithProgressBar(newPoints: progressBarData.newPoints,
                                         currentPoints: progressBarData.currentPoints,
                                         totalPoints: progressBarData.totalPoints,
                                         remainingPoints: progressBarData.remainingPoints,
                                         currentLevel: progressBarData.currentLevel.name,
                                         nextLevel: progressBarData.nextLevel?.name ?? "Nanashi")
                    .padding(.horizontal)
                }
                
                Button("Voir le parcours",
                       action: onPressPath)
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
                   .padding(.bottom)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Styles.background)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: Styles.actionsSpacing) {
                Button("Commencer le quiz", action: onPressStartQuiz)
                    .buttonStyle(.neubrutProminent(kind: .primary,
                                                   isFullWidth: true))
                
                Button("Passer le quiz", action: onPressSkipQuiz)
                    .buttonStyle(.neubrutProminent(kind: .neutral,
                                                   isFullWidth: true))
            }
            .padding(.horizontal)
            .padding(.bottom, Styles.actionsBottomPadding)
            .background {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [
                            Styles.background.opacity(0.64),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1)
                        ],
                                       startPoint: .bottom,
                                       endPoint: .top)
                    )
                    .padding(-20)
                    .blur(radius: 10)
                    .padding(20)
                    .padding(.top, -20)
            }
        }
        .safeAreaInset(edge: .bottom,
                       alignment: .center) {
            Text("")
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .fill(Styles.background)
                        .ignoresSafeArea(.all,
                                         edges: .bottom)
                }
        }
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.background
    
    static let vSpacing = AppToken.Primitive.spacing8
    
    static let actionsSpacing = AppToken.Primitive.spacing4
    static let actionsBottomPadding = AppToken.shadowSize
}

#Preview {
    TrekFinishedScene(duration: Duration.seconds(2 * 3600 + 23 * 60 + 45),
                      points: 220,
                      rank: (23, 302),
                      onPressPath: {},
                      onPressStartQuiz: {},
                      onPressSkipQuiz: {})
}
