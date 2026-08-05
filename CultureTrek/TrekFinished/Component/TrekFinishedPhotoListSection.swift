//
//  TrekFinishedPhotoListSection.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedPhotoListSection: View {
    let photos: [Image]
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            TrekFinishedSectionTitle("Photos prises")
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top,
                       spacing: Styles.hSpacing) {
                    ForEach(photos.enumerated(), id: \.offset) { item in
                        PhotoItem(image: item.element,
                                  riddleOrder: UInt.random(in: 1...12))
                    }
                }
                .padding(.horizontal)
            }
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
        }
    }
}

fileprivate struct PhotoItem: View {
    let image: Image
    let riddleOrder: UInt
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: Styles.itemSize,
                   height: Styles.itemSize)
            .overlay(alignment: .topLeading) {
                Text("#\(riddleOrder)")
                    .font(Styles.riddleOrderFont)
                    .foregroundStyle(Styles.riddleOrderForeground)
                    .padding(.horizontal, Styles.riddleOrderHPadding)
                    .frame(height: Styles.riddleOrderSize)
                    .frame(minWidth: Styles.riddleOrderSize,
                           alignment: .center)
                    .background(Styles.riddleOrderBackground)
            }
            .clipShape(Styles.itemShape)
            .overlay {
                Styles.itemShape
                    .strokeBorder(Styles.itemBorderColor,
                                  lineWidth: Styles.itemBorderWidth)
            }
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing2
    static let hSpacing = AppToken.Primitive.spacing4
    
    static let itemSize: Double = 100
    
    static let itemCornerRadius = AppToken.cornerRadius
    static let itemShape = RoundedRectangle(cornerRadius: itemCornerRadius)
    
    static let itemBorderColor = AppColor.border
    static let itemBorderWidth = AppToken.borderWidth
    
    static let riddleOrderSize: Double = 32
    static let riddleOrderHPadding: Double = 4
    static let riddleOrderForeground = AppColor.inverseForegroundPrimary
    static let riddleOrderBackground = AppColor.inverseBackground
    static let riddleOrderFont: Font = .spaceGrotesk(size: 15,
                                                     weight: .medium)
}

#Preview {
    TrekFinishedPhotoListSection(photos: [
        Image(.riddleTestPicture),
        Image(.riddleTestPicture),
        Image(.riddleTestPicture),
        Image(.riddleTestPicture),
        Image(.riddleTestPicture)
    ])
}
