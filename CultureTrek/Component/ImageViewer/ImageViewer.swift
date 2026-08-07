//
//  ImageViewer.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 07/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

// source https://github.com/Silenterc/ImageViewer/tree/main

import SwiftUI
import UIKit

struct ImageViewer: View {
    private let images: [UIImage]
    private var initialImageIndex: Int
    private var downloadAction: ((UIImage) -> Void)?
    private var shareAction: ((UIImage) -> Void)?
    
    @State private var currentImageIndex: Int
    @State private var showFullScreen: Bool = true
    
    private var safeAreaInsets: UIEdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets()
    }
    private var topPadding: CGFloat { safeAreaInsets.top + 4 }
    private let toolbarPadding: CGFloat = 8
    private let imageHeight: CGFloat = 40
    
    @Environment(\.dismiss) private var dismiss
    
    init(
        images: [UIImage],
        initialImageIndex: Int = 0,
        downloadAction: ((UIImage) -> Void)? = nil,
        shareAction: ((UIImage) -> Void)? = nil
    ) {
        self.images = images
        self.initialImageIndex = initialImageIndex
        self.downloadAction = downloadAction
        self.shareAction = shareAction
        _currentImageIndex = State(initialValue: initialImageIndex)
    }
    
    var body: some View {
        ZStack {
            ImagePreviewToolbar(
                onDismiss: { dismiss() },
                downloadAction: downloadAction != nil
                ? { downloadAction?(images[currentImageIndex]) }
                : nil,
                shareAction: shareAction != nil
                ? { shareAction?(images[currentImageIndex]) }
                : nil
            )
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, topPadding)
            .padding(.horizontal, toolbarPadding)
            .zIndex(2)
            .opacity(showFullScreen ? 1 : 0)
            .allowsHitTesting(showFullScreen)
            
            TabView(selection: $currentImageIndex) {
                ForEach(images.indices, id: \.self) { index in
                    ZoomableImage(
                        image: images[index],
                        resetBehavior: .onPageChange(
                            currentPageIndex: $currentImageIndex,
                            pageIndex: index
                        )
                    )
                    .onZoomStarted {
                        withAnimation {
                            showFullScreen = false
                        }
                    }
                    .onZoomEnded { zoom in
                        if zoom == 1 {
                            withAnimation {
                                showFullScreen = true
                            }
                        }
                    }
                    .onSingleTap {
                        withAnimation {
                            showFullScreen.toggle()
                        }
                    }
                    .ignoresSafeArea()
                    .tag(index)
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.default, value: currentImageIndex)
            
            ThumbnailPickerView(
                images: images,
                imageHeight: imageHeight,
                currentImageIndex: $currentImageIndex,
                imageCornerRadius: Styles.thumbnailCornerRadius
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, safeAreaInsets.bottom)
            .opacity(showFullScreen ? 1 : 0)
            .allowsHitTesting(showFullScreen)
        }
        .background(Styles.background.brightness(0.1))
        .ignoresSafeArea()
    }
}

fileprivate enum Styles {
    
    static let background: Color = Color.black
    
    static let thumbnailCornerRadius = AppToken.cornerRadius
}

#Preview {
    @Previewable @State var isPresented: Bool = false
    
    VStack {
        Button("Ouvrir") {
            isPresented = true
        }
        .buttonStyle(.glassProminent)
    }
    .frame(maxWidth: .infinity,
           maxHeight: .infinity)
    .background {
        Image(.riddleTestPicture)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .fullScreenCover(isPresented: $isPresented) {
        ImageViewer(images: [
            UIImage(resource: .riddleTestPicture),
            UIImage(resource: .trekTestPicture),
            UIImage(resource: .riddleTestPicture),
            UIImage(resource: .trekTestPicture),
            UIImage(resource: .riddleTestPicture),
        ])
    }
}
