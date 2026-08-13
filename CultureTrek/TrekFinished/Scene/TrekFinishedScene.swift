//
//  TrekFinishedScene.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import CoreLocation
import SwiftUI

struct TrekFinishedScene: View {
    let duration: Duration?
    let points: UInt?
    let rank: (current: UInt, total: UInt)?
    let photos: [RiddlePhoto]
    let badges: [Badge]
    let trekMode: Trek.Mode
    let onPressPath: () -> Void
    let onPressStartQuiz: () -> Void
    let onPressSkipQuiz: () -> Void
    let onPressPhotoItem: ([RiddlePhoto], Int) -> Void
    let onPressBadgeItem: (Badge) -> Void

    private let progressBarData: LevelCalculator.ProgressBarData?
    
    init(userXPPoints: UInt,
         duration: Duration?,
         points: UInt?,
         rank: (current: UInt, total: UInt)?,
         photos: [RiddlePhoto],
         badges: [Badge],
         trekMode: Trek.Mode,
         onPressPath: @escaping () -> Void,
         onPressStartQuiz: @escaping () -> Void,
         onPressSkipQuiz: @escaping () -> Void,
         onPressPhotoItem: @escaping ([RiddlePhoto], Int) -> Void,
         onPressBadgeItem: @escaping (Badge) -> Void) {
        self.duration = duration
        self.points = points
        self.rank = rank
        self.photos = photos
        self.badges = badges
        self.trekMode = trekMode
        
        if let points {
            progressBarData = LevelCalculator.getProgressBarData(currentXPPoints: userXPPoints,
                                                                 newXPPoints: points)
        } else {
            progressBarData = nil
        }
        self.onPressPath = onPressPath
        self.onPressStartQuiz = onPressStartQuiz
        self.onPressSkipQuiz = onPressSkipQuiz
        self.onPressPhotoItem = onPressPhotoItem
        self.onPressBadgeItem = onPressBadgeItem
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                TrekFinishedIcon()
                
                TrekFinishedTitleParagraphSection(title: "Félicitations",
                                                  paragraph: "Mission accomplie ! Tu as percé tous les mystères de ce parcours.")
                .padding(.horizontal)
                
                if trekMode == .ranked
                   && (duration != nil || points != nil || rank != nil) {
                    TrekFinishedColInfoRow(duration: duration,
                                           points: points,
                                           rank: rank)
                }
                
                if trekMode == .ranked,
                   let progressBarData {
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
                
                if badges.isNotEmpty {
                    TrekFinishedBadgeListSection(badges: badges) {
                        onPressBadgeItem($0)
                    }
                        .padding(.horizontal)
                }
                
                if photos.isNotEmpty {
                    TrekFinishedPhotoListSection(photos: photos) {
                        onPressPhotoItem(photos, $0)
                    }
                }
            }
                   .padding(.bottom)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Styles.background)
        .sceneFooter {
            VStack(spacing: Styles.actionsSpacing) {
                Button("Commencer le quiz", action: onPressStartQuiz)
                    .buttonStyle(.neubrutProminent(kind: .primary,
                                                   isFullWidth: true))
                
                Button("Passer le quiz", action: onPressSkipQuiz)
                    .buttonStyle(.neubrutProminent(kind: .neutral,
                                                   isFullWidth: true))
            }
        }
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.Page.background
    
    static let vSpacing = AppToken.Primitive.spacing8
    
    static let actionsSpacing = AppToken.Primitive.spacing4
    static let actionsBottomPadding = AppToken.shadowSize
}

#Preview {
    TrekFinishedScene(userXPPoints: 1100,
                      duration: Duration.seconds(2 * 3600 + 23 * 60 + 45),
                      points: 220,
                      rank: (23, 302),
                      photos: [
                        .init(riddleOrder: 1, image: UIImage(resource: .riddleTestPicture)),
                        .init(riddleOrder: 2, image: UIImage(resource: .trekTestPicture)),
                        .init(riddleOrder: 2, image: UIImage(resource: .riddleTestPicture)),
                      ],
                      badges: Badge.examples,
                      trekMode: .ranked,
                      onPressPath: {},
                      onPressStartQuiz: {},
                      onPressSkipQuiz: {},
                      onPressPhotoItem: { _,_  in },
                      onPressBadgeItem: { _ in })
}
