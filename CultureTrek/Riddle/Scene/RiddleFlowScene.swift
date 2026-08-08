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
    @State private var vm: RiddleFlowViewModel = .init()
    
    var body: some View {
        AnyView(vm.currentView)
            .popup(item: $vm.validRiddlePopupData) { data in
                GoodActionPopupView(title: data.title,
                                    obtainedXPPoints: data.points)
                .padding(Styles.popupHPadding)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(true)
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
                    .closeOnTap(true)
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
            .fullScreenCover(isPresented: $vm.isPathPresented) {
                VStack {
                    Text("Trek Path")
                    
                    Button("Close") {
                        vm.isPathPresented = false
                    }
                }
            }
            .fullScreenCover(isPresented: $vm.isFinalPathPresented) {
                VStack {
                    Text("Trek Final Path")
                    
                    Button("Close") {
                        vm.isFinalPathPresented = false
                    }
                }
            }
            .fullScreenCover(item: $vm.imageViewerData) { data in
                ImageViewer(images: data.images,
                            initialImageIndex: data.index)
            }
            .photosPicker(isPresented: $vm.isPhotoPickerPresented,
                          selection: $vm.selectedPhotoItem,
                          matching: .images)
            .task(id: vm.selectedPhotoItem) {
                if let data = try? await vm.selectedPhotoItem?.loadTransferable(type: Data.self) {
                    vm.addPhotoToRiddle(data: data)
                }
            }
    }
}

fileprivate enum Styles {
    
    static let popupBackground: Color = .black.opacity(0.32)
    static let popupHPadding = AppToken.Primitive.padding8
}

#Preview {
    RiddleFlowScene()
}
