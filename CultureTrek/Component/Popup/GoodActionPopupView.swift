//
//  GoodActionPopupView.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 03/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct GoodActionPopupView: View {
    let title: String
    let obtainedXPPoints: UInt
    
    @State private var isFirstPresented: Bool = false
    
    private let delay: Double = 1
    
    var body: some View {
        VStack(alignment: .center,
               spacing: Styles.vSpacing) {
            iconView
                .opacity(0)
                .overlay {
                    iconView
                        .symbolEffect(.drawOn.individually,
                                      isActive: !isFirstPresented)
                }
            
            titleView
                .opacity(0)
                .overlay {
                    if isFirstPresented {
                        titleView
                            .transition(.blurReplace.animation(.smooth.delay(delay)))
                    }
                }
            
            contentView
            .opacity(0)
            .overlay {
                if isFirstPresented {
                    contentView
                        .transition(.blurReplace.animation(.smooth.delay(delay * 1.64)))
                }
            }
        }
               .padding(Styles.padding)
               .background {
                   Styles.shape
                       .fill(Styles.background)
               }
               .overlay {
                   Styles.shape
                       .strokeBorder(Styles.borderColor,
                                     lineWidth: Styles.borderWidth)
               }
        .task {
            do {
                try await Task.sleep(for: .seconds(delay))
                
                isFirstPresented = true
            } catch {
                
            }
        }
    }
    
    private var iconView: some View {
        AppImage.Icon.popupValid.image
            .resizable()
            .scaledToFit()
            .fontWeight(Styles.iconWeight)
            .frame(width: Styles.iconSize,
                   height: Styles.iconSize)
            .foregroundStyle(Styles.iconColor)
    }
    
    private var titleView: some View {
        Text(title)
            .font(Styles.titleFont)
            .textCase(Styles.titleTextCase)
            .foregroundStyle(Styles.titleColor)
    }
    
    private var contentView: some View {
        HStack(spacing: Styles.subtitleSpacing) {
            AppImage.xpPointsIcon
                .resizable()
                .scaledToFit()
                .frame(width: Styles.xpPointsIconSize,
                       height: Styles.xpPointsIconSize)
            
            Text("\(obtainedXPPoints) points gagnés")
                .font(Styles.subtitleFont)
                .foregroundStyle(Styles.subtitleColor)
        }
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing4
    static let padding = AppToken.Primitive.padding8
    
    static let background = AppColor.popupGoodAnswerBackground
    static let cornerRadius = AppToken.popupCornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    static let borderColor = AppColor.border
    static let borderWidth: Double = AppToken.popupBorderWidth
    
    static let iconSize: Double = 128
    static let iconWeight: Font.Weight = .regular
    static let iconColor = AppColor.popupGoodAnswerForeground
    
    static let titleFont: Font = .system(size: 32,
                                         weight: .heavy)
        .width(.condensed)
    static let titleTextCase: Text.Case = .uppercase
    static let titleColor = AppColor.popupGoodAnswerForeground
    
    static let subtitleSpacing: Double = AppToken.Primitive.spacing2
    static let subtitleFont: Font = .spaceGrotesk(size: 20,
                                                  weight: .bold)
    static let subtitleColor = AppColor.Label.primary
    
    static let xpPointsIconSize: Double = 32
}

#Preview {
    GoodActionPopupView(title: "Énigme 7 validée",
                        obtainedXPPoints: 154)
}
