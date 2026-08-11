//
//  RiddleCard.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct RiddleCard: View {
    let order: UInt
    let picture: Image?
    let content: String
    let isCompleted: Bool
    let hasClue: Bool
    let onSubmit: () -> Void
    let onAskClue: () -> Void
    
    var body: some View {
        if let picture {
            TitledCard(title: title,
                       titlePrefixIcon: titlePrefixIcon,
                       content: content,
                       kind: kind,
                       contentAbove: { PictureView(picture) },
                       contentBelow: isCompleted ? nil : { actions })
        } else {
            TitledCard(title: title,
                       titlePrefixIcon: titlePrefixIcon,
                       content: content,
                       kind: kind,
                       contentBelow: isCompleted ? nil : { actions })
        }
    }
    
    private var actions: some View {
        HStack(alignment: .center,
               spacing: Styles.actionsSpacing) {
            Button("Je suis arrivé·e",
                   action: onSubmit)
            .buttonStyle(.neubrutProminent(kind: .neutral,
                                           isFullWidth: true))
            
            if hasClue {
                Button(action: onAskClue) {
                    AppImage.Icon.riddleClue.image
                }
                .buttonStyle(.neubrutIcon(kind: .secondary))
            }
        }
    }
    
    private var kind: TitledCard.Kind {
        isCompleted ? .success : .secondary
    }
    
    private var titlePrefixIcon: Image? {
        isCompleted ? AppImage.Icon.riddleCompletedTitlePrefix.image : nil
    }
    
    private var title: String {
        "Énigme \(order)"
    }
}

fileprivate struct PictureView: View {
    let picture: Image
    
    init(_ picture: Image) {
        self.picture = picture
    }
    
    var body: some View {
        picture
            .resizable()
            .scaledToFit()
            .clipShape(Styles.pictureShape)
            .overlay {
                Styles.pictureShape
                    .strokeBorder(Styles.pictureBorderColor,
                                  lineWidth: Styles.pictureBorderWidth)
            }
    }
}

fileprivate enum Styles {
    
    static let pictureBorderColor = AppColor.border
    static let pictureBorderWidth = AppToken.borderWidth
    static let pictureCornerRadius = AppToken.cornerRadius
    static let pictureShape = RoundedRectangle(cornerRadius: pictureCornerRadius)
    
    static let actionsSpacing: Double = AppToken.Primitive.spacing5
}

#Preview {
    VStack(spacing: 24) {
        RiddleCard(order: 2,
                   picture: nil,
                   content: "Minima nam quo dolor modi sequi cumque alias sunt ut quo sapiente molestias ut voluptate quae.",
                   isCompleted: true,
                   hasClue: true,
                   onSubmit: {},
                   onAskClue: {})
        
        RiddleCard(order: 2,
                   picture: AppImage.riddleTestPicture,
                   content: "Minima nam quo dolor modi sequi cumque alias sunt ut quo sapiente molestias ut voluptate quae.",
                   isCompleted: false,
                   hasClue: true,
                   onSubmit: {},
                   onAskClue: {})
    }
    .padding()
    .background(AppColor.Page.background)
}
