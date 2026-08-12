//
//  RiddleFlowScene.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 06/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import PhotosUI
import PopupView
import SwiftUI

struct RiddleFlowScene: View {
    @State private var vm: RiddleFlowViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(trek: Trek, user: User) {
        self._vm = State(initialValue: .init(trek: trek,
                                             user: user))
    }
    
    var body: some View {
        AnyView(vm.currentView)
            .popup(item: $vm.validRiddlePopupData) { data in
                GoodActionPopupView(title: data.title,
                                    obtainedXPPoints: data.points)
                .padding(Styles.popupHPadding)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(false)
                    .closeOnTapOutside(false)
                    .backgroundColor(Styles.popupBackground)
                    .willDismissCallback(vm.validRiddle)
            }
            .popup(isPresented: $vm.isInvalidRiddlePopupPresented) {
                BadActionPopupView(title: "Énigme non validée",
                                   content: "Ce n’est pas le bon endroit… mais ne lâche rien ! »")
                .padding(Styles.popupHPadding)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(false)
                    .closeOnTapOutside(false)
                    .backgroundColor(Styles.popupBackground)
            }
            .popup(item: $vm.riddleClueForPopup) { clue in
                RiddleCluePopupView(content: clue)
            } customize: {
                $0
                    .closeOnTap(true)
                    .closeOnTapOutside(true)
                    .backgroundColor(Styles.popupBackground)
            }
            .popup(item: $vm.badgeForPopup) { badge in
                BadgePopupView(badge: badge)
            } customize: {
                $0
                    .closeOnTap(true)
                    .closeOnTapOutside(true)
                    .backgroundColor(Styles.popupBackground)
            }
            .fullScreenCover(item: $vm.trekPathData) { data in
                TrekPathScene(riddles: data.riddles,
                              hasLastRiddle: data.hasLastRiddle)
            }
            .fullScreenCover(item: $vm.imageViewerData) { data in
                ImageViewer(images: data.images,
                            initialImageIndex: data.index)
            }
            .photosPicker(isPresented: $vm.isPhotoPickerPresented,
                          selection: $vm.selectedPhotoItem,
                          matching: .images)
            .fullScreenCover(isPresented: $vm.isQuizPresented,
                             onDismiss: {
                dismiss()
            }) {
                QuizScene(questions: vm.getQuizQuestions())
            }
            .task(id: vm.selectedPhotoItem) {
                if let data = try? await vm.selectedPhotoItem?.loadTransferable(type: Data.self) {
                    vm.addPhotoToRiddle(data: data)
                }
            }
            .onAppear {
                vm.onDismiss = { dismiss() }
            }
    }
}

fileprivate enum Styles {
    
    static let popupBackground: Color = .black.opacity(0.32)
    static let popupHPadding = AppToken.Primitive.padding8
}

#Preview {
    let user = User.example
    
    RiddleFlowScene(trek: /*.liveDemoExamples.first ?? */testTrek,
                    user: user)
    .environment(AppStore(user: user))
}

fileprivate let testTrek: Trek = .init(
    accessibility: Trek.Accessibility.init(bike: false,
                                           stroller: false,
                                           walking: false,
                                           wheelchair: false),
    badgesToUnlock: Badge.examples,
    city: "Saint-Denis",
    completion: nil,
    department: "Seine-Saint-Denis",
    distance: .init(value: 2.1, unit: .kilometers),
    duration: .seconds(1 * 3600 + 15 * 60),
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
