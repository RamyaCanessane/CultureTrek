//
//  RiddleScene.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct RiddleScene: View {
    let trekTitle: String
    let riddle: Riddle
    let startDate: Date?
    let duration: Duration?
    let currentRiddleOrder: UInt
    let totalRiddle: UInt
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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                if let duration {
                    RiddleTime(time: .duration(duration))
                } else if let startDate {
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
                                           onPressItem: {
                        onPressPhotoItem(riddle.photos, $0)
                    },
                                           isAddDisabled: false,
                                           onAddPressed: {})
                    
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
        .safeAreaInset(edge: .top,
                       alignment: .center) {
            RiddleSceneHeader(title: trekTitle,
                              onPressPath: onPressPath)
                .padding(.horizontal)
                .padding(.bottom, Styles.vPadding)
                .background {
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [
                                Styles.background.opacity(0.64),
                                Styles.background.opacity(1),
                                Styles.background.opacity(1)
                            ],
                                           startPoint: .bottom,
                                           endPoint: .top)
                        )
                        .padding(-20)
                        .blur(radius: 10)
                        .padding(20)
                        .padding(.top, -20)
                }
        }
                       .safeAreaInset(edge: .top,
                                      alignment: .center) {
                           Text("")
                               .frame(maxWidth: .infinity)
                               .background {
                                   Rectangle()
                                       .fill(Styles.background)
                                       .ignoresSafeArea(.all,
                                                        edges: .top)
                               }
                       }
                                      .safeAreaInset(edge: .bottom) {
                                          actionsProgressBar
                                              .padding(.horizontal)
                                              .padding(.top, Styles.vPadding)
                                              .padding(.bottom, Styles.actionsBottomPadding)
                                              .background {
                                                  Rectangle()
                                                      .fill(
                                                        LinearGradient(colors: [
                                                            Styles.background.opacity(1),
                                                            Styles.background.opacity(1),
                                                            Styles.background.opacity(1),
                                                            Styles.background.opacity(0.64)
                                                        ],
                                                                       startPoint: .bottom,
                                                                       endPoint: .top)
                                                      )
                                                      .padding(-20)
                                                      .blur(radius: 10)
                                                      .padding(20)
                                                      .padding(.bottom, -20)
                                              }
                                      }
                                      .safeAreaInset(edge: .bottom,
                                                     alignment: .center) {
                                          Text("")
                                              .frame(maxWidth: .infinity)
                                              .background {
                                                  Rectangle()
                                                      .fill(Styles.background)
                                                      .ignoresSafeArea(.all,
                                                                       edges: .bottom)
                                              }
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
    
    static let background = AppColor.background
    
    static let vSpacing = AppToken.Primitive.spacing6
    static let vPadding = AppToken.Primitive.spacing6
    
    static let actionsProgressBarSpacing = AppToken.Primitive.spacing4
    static let actionsBottomPadding = AppToken.shadowSize
}

fileprivate let riddleExample = Riddle(
    clue: "Quasi modi nihil consequuntur. Dicta praesentium quia sequi et ex qui sunt ut.",
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
                riddle: riddleExample,
                startDate: .now,
                duration: nil,
                currentRiddleOrder: 7,
                totalRiddle: 12,
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
                onPressPhotoItem: { _, _ in })
}
