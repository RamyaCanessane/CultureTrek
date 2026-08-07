//
//  RiddleFlowViewModel.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 06/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

@Observable
final class RiddleFlowViewModel {
    
    var riddles: [Riddle]
    
    private var currentRiddleIndex: Int
    private let trekTitle: String
    
    var validRiddlePopupData: ValidRiddlePopupData? = nil
    var isInvalidRiddlePopupPresented: Bool = false
    var riddleClueForPopup: String? = nil
    var isPathPresented: Bool = false
    
    var isTrekFinishedPresented: Bool = false
    var isFinalPathPresented: Bool = false
    
    private var startDate: Date?
    private var duration: Duration?
    
    struct ValidRiddlePopupData: Equatable {
        let title: String
        let points: UInt
    }
    
    init(trek: Trek = RiddleFlowViewModel.testTrek) {
        self.trekTitle = trek.name
        self.riddles = trek.riddles
        self.currentRiddleIndex = 0
        self.startDate = nil
        self.duration = nil
    }
    
    var currentView: any View {
        if riddles.allSatisfy(\.isCompleted) && isTrekFinishedPresented {
            #warning("use points calculator to calculate points base on completionPoints and duration")
            
            let points = riddles.map(\.validationPoints).reduce(0, +) + 0 // Add points base on duration
            
            #warning("utilisation de fausses données pour rank")
            
            let rank: (current: UInt, total: UInt) = (UInt.random(in: 5...40), UInt.random(in: 100...150))
            
            return TrekFinishedScene(duration: duration,
                                     points: points,
                                     rank: rank,
                                     onPressPath: showFinalPath,
                                     onPressStartQuiz: {},
                                     onPressSkipQuiz: {})
        }
        
        guard let riddle = riddles[safe: currentRiddleIndex] else {
            return Text("Aucune énigme n'est disponible")
        }
        
        return RiddleScene(trekTitle: trekTitle,
                           riddle: riddle,
                           startDate: startDate,
                           duration: duration,
                           currentRiddleOrder: currentRiddleOrder,
                           totalRiddle: totalRiddle,
                           previousButton: previousButton,
                           nextButton: nextButton,
                           onSubmit: submitRiddle,
                           onPressClue: showClue,
                           onPressPath: showPath)
    }
    
    var previousButton: (icon: Image, kind: NeubrutIconButtonStyle.Kind, isEnabled: Bool, action: () -> Void) {
        if currentRiddleIndex < 1 {
            return (icon: AppImage.Icon.riddleClose.image,
                    kind: NeubrutIconButtonStyle.Kind.destructive,
                    isEnabled: true,
                    action: closeRiddleFlow)
        } else {
            return (icon: AppImage.Icon.riddleBack.image,
                    kind: NeubrutIconButtonStyle.Kind.primary,
                    isEnabled: true,
                    action: goToPreviousRiddle)
        }
    }
    
    var nextButton: (icon: Image, kind: NeubrutIconButtonStyle.Kind, isEnabled: Bool, action: () -> Void) {
        guard let riddle = riddles[safe: currentRiddleIndex] else {
            return (icon: AppImage.Icon.riddleNext.image,
                    kind: NeubrutIconButtonStyle.Kind.destructive,
                    isEnabled: false,
                    action: {})
        }
        
        if currentRiddleIndex >= riddles.count - 1 {
            return (icon: AppImage.Icon.riddleNext.image,
                    kind: NeubrutIconButtonStyle.Kind.success,
                    isEnabled: riddle.isCompleted,
                    action: goToFinishedTrekScene)
        } else {
            return (icon: AppImage.Icon.riddleNext.image,
                    kind: NeubrutIconButtonStyle.Kind.primary,
                    isEnabled: riddle.isCompleted,
                    action: goToNextRiddle)
        }
    }
    
    func validRiddle() {
        riddles[currentRiddleIndex].isCompleted = true
        
        if currentRiddleIndex >= riddles.count - 1 {
            self.duration = startDate == nil
            ? nil
            : Duration.seconds(Date.now.timeIntervalSince(startDate ?? .now))
        }
    }
    
    private func goToFinishedTrekScene() {
        isTrekFinishedPresented = true
    }
    
    private var currentRiddleOrder: UInt {
        UInt(currentRiddleIndex) + 1
    }
    
    private var totalRiddle: UInt {
        UInt(riddles.count)
    }
    
    private func closeRiddleFlow() {
        // TODO: close RiddleFlow
    }
    
    private func goToPreviousRiddle() {
        guard currentRiddleIndex > 0 else {
            return
        }
        
        currentRiddleIndex -= 1
    }
    
    private func goToNextRiddle() {
        guard currentRiddleIndex < riddles.count - 1 else {
            return
        }
        
        currentRiddleIndex += 1
        
        if startDate == nil && currentRiddleIndex == 1 {
            startDate = .now
        }
    }
    
    private func submitRiddle() {
        let isValid = true // TODO: add random to simulate valid and invalid riddle
        
        if isValid {
            showValidRiddlePopup()
        } else {
            showInvalidRiddlePopup()
        }
    }
    
    private func showValidRiddlePopup() {
        guard let riddle = riddles[safe: currentRiddleIndex] else {
            return
        }
        
        validRiddlePopupData = .init(title: "Énigme \(riddle.order) validée",
                                     points: riddle.validationPoints)
    }
    
    private func showInvalidRiddlePopup() {
        isInvalidRiddlePopupPresented = true
    }
    
    private func showClue() {
        guard let riddle = riddles[safe: currentRiddleIndex],
              let clue = riddle.clue else {
            return
        }
        
        riddleClueForPopup = clue
    }
    
    private func showPath() {
        isPathPresented = true
    }
    
    private func showFinalPath() {
        isFinalPathPresented = true
    }
}

extension RiddleFlowViewModel {
    
    static let testTrek: Trek = .init(
        accessibility: Trek.Accessibility.init(bike: false,
                                               stroller: false,
                                               walking: false,
                                               wheelchair: false),
        badgesToUnlock: [],
        city: "Saint-Denis",
        completion: nil,
        department: "Seine-Saint-Denis",
        distance: .init(value: 2.1, unit: .kilometers),
        duration: .seconds(1 * 3600 + 30 * 60),
        elevation: .low,
        goal: nil,
        goodToKnow: [],
        isLiked: false,
        name: "Paris, art et rues",
        picture: Image(.trekTestPicture),
        riddles: Riddle.examples,
        quizQuestions: [],
        region: "Île-de-France",
        summary: nil
    )
}
