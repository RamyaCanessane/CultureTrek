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
    
    var riddles: [Riddle]
    
    private var currentRiddleIndex: Int
    private let trekTitle: String
    private let trekBadges: [Badge]
    
    var selectedPhotoItem: PhotosPickerItem?
    
    var isPhotoPickerPresented: Bool = false
    
    var validRiddlePopupData: ValidRiddlePopupData? = nil
    var isInvalidRiddlePopupPresented: Bool = false
    var riddleClueForPopup: String? = nil
    var badgeForPopup: Badge? = nil
    
    var isPathPresented: Bool = false
    
    var imageViewerData: ImageViewerData? = nil
    
    var isTrekFinishedPresented: Bool = false
    var isFinalPathPresented: Bool = false
    
    private var startDate: Date?
    private var duration: Duration?
    
    private let riddleMaxPhotos: UInt = 3
    
    struct ValidRiddlePopupData: Equatable {
        let title: String
        let points: UInt
    }
    
    struct ImageViewerData: Identifiable {
        let id = UUID()
        let images: [UIImage]
        let index: Int
    }
    
    init(trek: Trek = RiddleFlowViewModel.testTrek) {
        self.trekTitle = trek.name
        self.riddles = trek.riddles
        self.currentRiddleIndex = 0
        self.startDate = nil
        self.duration = nil
        self.trekBadges = trek.badgesToUnlock
    }
    
    var currentView: any View {
        if riddles.allSatisfy(\.isCompleted) && isTrekFinishedPresented {
            #warning("use points calculator to calculate points base on completionPoints and duration")
            
            let points = riddles.map(\.validationPoints).reduce(0, +) + 0 // TODO: Ajouter des points en se basant sur la durée
            
            #warning("utilisation de fausses données pour rank")
            
            let rank: (current: UInt, total: UInt) = (24, 127)
            
            let photos = riddles.flatMap { riddle in
                riddle.photos.map({ photo in
                    RiddlePhoto(riddleOrder: riddle.order,
                                image: photo)
                })
            }
            
            let badges = trekBadges // TODO: Ajouter seulement les badges obtenus
            
            return TrekFinishedScene(duration: duration,
                                     points: points,
                                     rank: rank,
                                     photos: photos,
                                     badges: badges,
                                     onPressPath: showFinalPath,
                                     onPressStartQuiz: {},
                                     onPressSkipQuiz: {},
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
                           riddle: riddle,
                           startDate: startDate,
                           duration: duration,
                           currentRiddleOrder: currentRiddleOrder,
                           totalRiddle: totalRiddle,
                           isAddPhotoDisabled: riddle.photos.count >= riddleMaxPhotos,
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
    
    private func showBadge(badge: Badge) {
        badgeForPopup = badge
    }
    
    private func showPath() {
        isPathPresented = true
    }
    
    private func showFinalPath() {
        isFinalPathPresented = true
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
}

extension RiddleFlowViewModel {
    
    static let testTrek: Trek = .init(
        accessibility: Trek.Accessibility.init(bike: false,
                                               stroller: false,
                                               walking: false,
                                               wheelchair: false),
        badgesToUnlock: Badge.examples,
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
