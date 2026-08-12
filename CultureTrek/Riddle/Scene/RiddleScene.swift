//
//  RiddleScene.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import CoreLocation
import SwiftUI

struct RiddleScene: View {
    let trekTitle: String
    let trekMode: Trek.Mode
    let riddle: Riddle
    let startDate: Date?
    let duration: Duration?
    let currentRiddleOrder: UInt
    let totalRiddle: UInt
    let isAddPhotoDisabled: Bool
    let isPathButtonDisabled: Bool
    let previousButton: (icon: Image,
                         kind: NeubrutIconButtonStyle.Kind,
                         isEnabled: Bool,
                         action: () -> Void)
    let nextButton: (icon: Image,
                     kind: NeubrutIconButtonStyle.Kind,
                     isEnabled: Bool,
                     action: () -> Void)
    let onSubmit: () -> Void
    let onPressClue: () -> Void
    let onPressPath: () -> Void
    let onPressPhotoItem: ([UIImage], Int) -> Void
    let onPressDeletePhotoItem: ([UIImage], Int) -> Void
    let onPressOpenCamera: () -> Void
    let onPressOpenPhotoLibrary: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                if trekMode == .ranked,
                   let duration {
                    RiddleTime(time: .duration(duration))
                } else if trekMode == .ranked,
                          let startDate {
                    RiddleTime(time: .stopWatch(startDate: startDate))
                }
                
                RiddleCard(order: riddle.order,
                           picture: riddle.picture,
                           content: riddle.summary,
                           isCompleted: riddle.isCompleted,
                           hasClue: riddle.clue != nil,
                           onSubmit: onSubmit,
                           onAskClue: onPressClue)
                .padding(.horizontal)
                
                if riddle.isCompleted {
                    RiddlePhotoListSection(photos: riddle.photos,
                                           isAddDisabled: isAddPhotoDisabled,
                                           onPressItem: {
                        onPressPhotoItem(riddle.photos, $0)
                    },
                                           onPressDelete: {
                        onPressDeletePhotoItem(riddle.photos, $0)
                    },
                                           onPressOpenCamera: onPressOpenCamera,
                                           onPressOpenPhotoLibrary: onPressOpenPhotoLibrary)
                    
                    if let goodToKnow = riddle.goodToKnow {
                        RiddleGoodToKnow(content: goodToKnow)
                            .padding(.horizontal)
                    }
                }
            }
                   .padding(.bottom, Styles.vPadding)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Styles.background)
        .sceneHeader {
            RiddleSceneHeader(title: trekTitle,
                              onPressPath: onPressPath)
            .disabled(isPathButtonDisabled)
        }
        .sceneFooter {
            actionsProgressBar
        }
    }
    
    private var actionsProgressBar: some View {
        HStack(alignment: .center,
               spacing: Styles.actionsProgressBarSpacing) {
            Button(action: previousButton.action) {
                previousButton.icon
            }
            .buttonStyle(.neubrutIcon(kind: previousButton.kind))
            .disabled(!previousButton.isEnabled)
            
            LabeledProgressBar(current: currentRiddleOrder,
                               total: totalRiddle)
            .animation(.bouncy,
                       value: currentRiddleOrder)
            
            Button(action: nextButton.action) {
                nextButton.icon
            }
            .buttonStyle(.neubrutIcon(kind: nextButton.kind))
            .disabled(!nextButton.isEnabled)
        }
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.Page.background
    
    static let vSpacing = AppToken.Primitive.spacing6
    static let vPadding = AppToken.Primitive.spacing6
    
    static let actionsProgressBarSpacing = AppToken.Primitive.spacing4
    static let actionsBottomPadding = AppToken.shadowSize
}

fileprivate let riddleExample = Riddle(
    clue: "Quasi modi nihil consequuntur. Dicta praesentium quia sequi et ex qui sunt ut.",
    coordinate: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3499),
    goodToKnow: "Illum vel quos temporibus temporibus architecto eveniet et minima ad amet.",
    isCompleted: true,
    order: 3,
    picture: AppImage.riddleTestPicture,
    photos: [
        UIImage(resource: .trekTestPicture),
        UIImage(resource: .riddleTestPicture),
        UIImage(resource: .trekTestPicture)
    ],
    summary: "Autem aperiam aut velit delectus voluptatibus ut qui aut. Illo est qui et nostrum eligendi ut soluta accusamus deleniti voluptas repellendus cum excepturi.",
    validationPoints: 40
)

#Preview {
    RiddleScene(trekTitle: "Numquam natus nam deleniti",
                trekMode: .casual,
                riddle: riddleExample,
                startDate: .now,
                duration: nil,
                currentRiddleOrder: 7,
                totalRiddle: 12,
                isAddPhotoDisabled: false,
                isPathButtonDisabled: false,
                previousButton: (icon: AppImage.Icon.riddlePath.image,
                                 kind: NeubrutIconButtonStyle.Kind.info,
                                 isEnabled: true,
                                 action: {}),
                nextButton: (icon: AppImage.Icon.popupValid.image,
                             kind: NeubrutIconButtonStyle.Kind.success,
                             isEnabled: true,
                             action: {}),
                onSubmit: {},
                onPressClue: {},
                onPressPath: {},
                onPressPhotoItem: { _, _ in },
                onPressDeletePhotoItem: { _, _ in },
                onPressOpenCamera: {},
                onPressOpenPhotoLibrary: {})
}
