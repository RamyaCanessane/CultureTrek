//
//  RiddleFlowViewModel.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 06/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import PhotosUI
import SwiftUI

@Observable
final class RiddleFlowViewModel {
    
    var onDismiss: () -> Void = {}
    
    private let sourceUser: User
    private let sourceTrek: Trek
    private let savedRiddles: [Riddle]
    var riddles: [Riddle]
    
    private var isTrekSettingsPresented: Bool
    private let estimatedTrekDuration: Duration
    private var trekMode: Trek.Mode
    private var trekPlayFormat: Trek.PlayFormat
    private var trekIsDownloaded: Bool
    
    private var currentRiddleIndex: Int
    private let trekTitle: String
    private let trekBadges: [Badge]
    
    var selectedPhotoItem: PhotosPickerItem?
    
    var isPhotoPickerPresented: Bool = false
    
    var validRiddlePopupData: ValidRiddlePopupData? = nil
    var isInvalidRiddlePopupPresented: Bool = false
    var riddleClueForPopup: String? = nil
    var badgeForPopup: Badge? = nil

    var trekPathData: TrekPathData? = nil
    
    var imageViewerData: ImageViewerData? = nil
    
    var isTrekFinishedPresented: Bool = false
    var isQuizPresented: Bool = false
    
    private var startDate: Date?
    private var duration: Duration?
    
    private let riddleMaxPhotos: UInt = 3
    
    struct ValidRiddlePopupData: Equatable {
        let title: String
        let points: UInt?
    }
    
    struct ImageViewerData: Identifiable {
        let id = UUID()
        let images: [UIImage]
        let index: Int
    }
    
    struct TrekPathData: Identifiable {
        let id = UUID()
        let riddles: [Riddle]
        let hasLastRiddle: Bool
    }
    
    init(trek: Trek, user: User) {
        self.sourceUser = user
        self.sourceTrek = trek
        self.savedRiddles = trek.riddles
        self.isTrekSettingsPresented = true
        
        self.estimatedTrekDuration = trek.duration
        self.trekTitle = trek.name
        self.trekBadges = trek.badgesToUnlock
        
        self.trekMode = .ranked
        self.trekPlayFormat = .solo
        self.trekIsDownloaded = false
        
        self.riddles = self.savedRiddles
        self.currentRiddleIndex = 0
        self.startDate = nil
        self.duration = nil
        
    }
    
    var currentView: any View {
        if isTrekSettingsPresented {
            return TrekSettingsScene(duration: estimatedTrekDuration,
                                     mode: trekMode,
                                     playFormat: trekPlayFormat,
                                     isDownloaded: trekIsDownloaded,
                                     onPressStart: { mode, playFormat, isDownloaded in
                self.startTrek(mode: mode,
                               playFormat: playFormat,
                               isDownloaded: isDownloaded)
            },
                                     onDismiss: onDismiss)
        }
        
        if riddles.allSatisfy(\.isCompleted) && isTrekFinishedPresented {
            #warning("use points calculator to calculate points base on completionPoints and duration")
            
            let points = calculatePoints()
            
            #warning("utilisation de fausses données pour rank")
            
            let rank: (current: UInt, total: UInt) = (24, 127)
            
            let photos = riddles.flatMap { riddle in
                riddle.photos.map({ photo in
                    RiddlePhoto(riddleOrder: riddle.order,
                                image: photo)
                })
            }
            
            let badges = getUnlockedBadges()
            
            return TrekFinishedScene(duration: duration,
                                     points: points,
                                     rank: rank,
                                     photos: photos,
                                     badges: badges,
                                     trekMode: trekMode,
                                     onPressPath: showFinalPath,
                                     onPressStartQuiz: startQuiz,
                                     onPressSkipQuiz: skipQuiz,
                                     onPressPhotoItem: { data, index in
                let images = data.map { $0.image }
                self.showImageViewer(images: images, index: index)
            },
                                     onPressBadgeItem: showBadge)
        }
        
        guard let riddle = riddles[safe: currentRiddleIndex] else {
            return Text("Aucune énigme n'est disponible")
        }
        
        return RiddleScene(trekTitle: trekTitle,
                           trekMode: trekMode,
                           riddle: riddle,
                           startDate: startDate,
                           duration: duration,
                           currentRiddleOrder: currentRiddleOrder,
                           totalRiddle: totalRiddle,
                           isAddPhotoDisabled: riddle.photos.count >= riddleMaxPhotos,
                           isPathButtonDisabled: isPathButtonDisabled,
                           previousButton: previousButton,
                           nextButton: nextButton,
                           onSubmit: submitRiddle,
                           onPressClue: showClue,
                           onPressPath: showPath,
                           onPressPhotoItem:{ images, index in
            self.showImageViewer(images: images, index: index)
        },
                           onPressDeletePhotoItem: { images, index in
            self.deletePhotoItem(images: images, index: index)
        },
                           onPressOpenCamera: {},
                           onPressOpenPhotoLibrary: showPhotoLibrary)
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
    }
    
    func addPhotoToRiddle(data: Data) {
        selectedPhotoItem = nil
        
        guard let riddle = riddles[safe: currentRiddleIndex] else {
            return
        }
        
        guard riddle.photos.count < riddleMaxPhotos else {
            return
        }
        
        guard let image = UIImage(data: data) else {
            return
        }
        
        riddles[currentRiddleIndex].photos.append(image)
    }
    
    func getQuizQuestions() -> [QuizQuestion] {
        sourceTrek.quizQuestions
    }
    
    private var isPathButtonDisabled: Bool {
        if riddles.count(where: { $0.isCompleted }) < 1 {
            return true
        }
        
        return false
    }
    
    private func startTrek(mode: Trek.Mode, playFormat: Trek.PlayFormat, isDownloaded: Bool) {
        trekMode = mode
        trekPlayFormat = playFormat
        trekIsDownloaded = isDownloaded
        
        isTrekSettingsPresented = false
    }
    
    private func resetTrek() {
        self.riddles = self.savedRiddles
        self.currentRiddleIndex = 0
        self.startDate = nil
        self.duration = nil
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
        isTrekSettingsPresented = true
        
        resetTrek()
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
    
    private var testFailOnce: Bool = false
    
    private func submitRiddle() {
        // Simule un échec de validation pour le 3ème Riddle
        let isValid: Bool
        
        if currentRiddleIndex == 2 && !testFailOnce {
            testFailOnce = true
            isValid = false
        } else {
            isValid = true
        }
        
        if isValid {
            if currentRiddleIndex >= riddles.count - 1 {
                self.duration = startDate == nil
                ? nil
                : Duration.seconds(Date.now.timeIntervalSince(startDate ?? .now))
            }
            
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
                                     points: trekMode == .ranked
                                             ? riddle.validationPoints
                                             : nil)
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
    
    private func showBadge(badge: Badge) {
        badgeForPopup = badge
    }
    
    private func showPath() {
        let pathRiddles = riddles.filter(\.isCompleted)
        
        trekPathData = .init(riddles: pathRiddles,
                             hasLastRiddle: pathRiddles.count == riddles.count)
    }
    
    private func showFinalPath() {
        let pathRiddles = riddles.filter(\.isCompleted)
        
        trekPathData = .init(riddles: pathRiddles,
                             hasLastRiddle: true)
    }
    
    private func showImageViewer(images: [UIImage], index: Int) {
        imageViewerData = .init(images: images, index: index)
    }
    
    private func showPhotoLibrary() {
        isPhotoPickerPresented = true
    }
    
    private func deletePhotoItem(images: [UIImage], index: Int) {
        riddles[currentRiddleIndex].photos.remove(at: index)
    }
    
    private func startQuiz() {
        completeTrek()
        
        isQuizPresented = true
    }
    
    private func skipQuiz() {
        completeTrek()
        
        onDismiss()
    }
    
    private func completeTrek() {
        let photos = getPhotosFromRiddles()
        
        if trekMode == .ranked {
            print(sourceTrek.completion ?? "Completion is nil")
            
            let points = calculatePoints()
            let badges = getUnlockedBadges()
            
            sourceTrek.complete(date: .now,
                                duration: duration ?? .seconds(0),
                                earnedPoints: points,
                                photos: photos,
                                unlockedBadges: badges)
            
            print(sourceTrek.completion ?? "After update, completion is nil")
            
            print(sourceUser)
            
            sourceUser.addXPPoints(points)
            
            print(sourceUser)
        } else {
            sourceTrek.complete(date: .now,
                                photos: photos)
            
            print(sourceUser)
            
            sourceUser.addXPPoints(0)
            
            print(sourceUser)
        }
    }
    
    private func calculatePoints() -> UInt {
        riddles.map(\.validationPoints).reduce(0, +) + 0 // TODO: Ajouter des points en se basant sur la durée
    }
    
    private func getPhotosFromRiddles() -> [RiddlePhoto] {
        riddles.flatMap { riddle in
            riddle.photos.map({ photo in
                RiddlePhoto(riddleOrder: riddle.order,
                            image: photo)
            })
        }
    }
    
    private func getUnlockedBadges() -> [Badge] {
        trekBadges // TODO: Ajouter seulement les badges obtenus
    }
}
