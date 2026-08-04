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
    let duration: Duration
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: Styles.vSpacing) {
                RiddleTime(duration: duration)
                
                RiddleCard(order: riddle.order,
                           picture: riddle.picture,
                           content: riddle.summary,
                           isCompleted: riddle.isCompleted)
                .padding(.horizontal)
                
                if riddle.isCompleted {
                    RiddlePhotoListSection(photos: [
                        Image(.riddleTestPicture),
                        Image(.riddleTestPicture),
                        Image(.riddleTestPicture)
                    ],
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
            RiddleSceneHeader(title: trekTitle)
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
            Button(action: {}) {
                AppImage.Icon.riddleBack.image
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            
            Rectangle()
                .fill(.red)
                .frame(height: 16)
            
            Button(action: {}) {
                AppImage.Icon.riddleNext.image
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            .disabled(!riddle.isCompleted)
        }
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.background
    
    static let vSpacing = AppToken.Primitive.spacing6
    static let vPadding = AppToken.Primitive.spacing6
    
    static let actionsProgressBarSpacing = AppToken.Primitive.spacing4
}

fileprivate let riddleExample = Riddle(
    clue: "Quasi modi nihil consequuntur. Dicta praesentium quia sequi et ex qui sunt ut.",
    goodToKnow: "Illum vel quos temporibus temporibus architecto eveniet et minima ad amet.",
    isCompleted: true,
    order: 3,
    picture: AppImage.riddleTestPicture,
    summary: "Autem aperiam aut velit delectus voluptatibus ut qui aut. Illo est qui et nostrum eligendi ut soluta accusamus deleniti voluptas repellendus cum excepturi."
)

#Preview {
    RiddleScene(trekTitle: "Numquam natus nam deleniti",
                riddle: riddleExample,
                duration: .seconds(60 * 12 + 27))
}
