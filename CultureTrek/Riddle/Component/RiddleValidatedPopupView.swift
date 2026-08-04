//
//  RiddleValidatedPopupView.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 03/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleValidatedPopupView: View {
    let riddleOrder: UInt
    let obtainedXPPoints: UInt
    
    @State private var isFirstPresented: Bool = false
    
    private let delay: Double = 1
    
    var body: some View {
        VStack(alignment: .center,
               spacing: Styles.vSpacing) {
            Image(systemName: "checkmark.circle")
                .font(Styles.iconFont)
                .symbolEffect(.drawOn.individually,
                              isActive: !isFirstPresented)
                .foregroundStyle(Styles.iconColor)
            
            // TODO: ne doit pas sauter
            
            if isFirstPresented {
                Text("Énigme \(riddleOrder) validée")
                    .font(Styles.titleFont)
                    .textCase(Styles.titleTextCase)
                    .foregroundStyle(Styles.titleColor)
                    .transition(.blurReplace.animation(.smooth.delay(delay)))
                
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
               .padding([.leading, .trailing, .bottom],
                        Styles.padding)
               .padding(.top,
                        Styles.topPadding)
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
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing4
    static let topPadding = AppToken.Primitive.padding6
    static let padding = AppToken.Primitive.padding8
    
    static let background = AppColor.popupGoodAnswerBackground
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    static let borderColor = AppColor.border
    static let borderWidth: Double = 4
    
    static let iconFont: Font = .system(size: 128,
                                        weight: .medium)
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
    RiddleValidatedPopupView(riddleOrder: 7,
                             obtainedXPPoints: 154)
}
