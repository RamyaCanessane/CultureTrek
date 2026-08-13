//
//  BadgePopupView.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 08/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct BadgePopupView: View {
    
    let obtained : Bool
    
    let badge: Badge
    
    @State private var isFirstPresented: Bool = false
    
    private let startDelay: Double = 0.4
    private let delay: Double = 0.6
    
    var body: some View {
        VStack(alignment: .center,
               spacing: Styles.vSpacing) {
            iconView
                .opacity(0)
                .overlay {
                    if isFirstPresented {
                        iconView
                            .transition(.blurReplace.animation(.smooth))
                    }
                }
                .grayscale(obtained ? 0 : 1)
            
            nameView
                .opacity(0)
                .overlay {
                    if isFirstPresented {
                        nameView
                            .transition(.blurReplace.animation(.smooth.delay(delay)))
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
                       try await Task.sleep(for: .seconds(startDelay))
                       
                       isFirstPresented = true
                   } catch {
                       
                   }
               }
    }
    
    private var iconView: some View {
        badge.icon
            .resizable()
            .scaledToFit()
            .frame(width: Styles.iconSize,
                   height: Styles.iconSize)
    }
    
    private var nameView: some View {
        Text(badge.name)
            .font(Styles.titleFont)
            .foregroundStyle(Styles.titleColor)
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing4
    static let padding = AppToken.Primitive.padding8
    
    static let background = AppColor.accentNeutral
    static let cornerRadius = AppToken.popupCornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    static let borderColor = AppColor.border
    static let borderWidth: Double = AppToken.popupBorderWidth
    
    static let iconSize: Double = 152
    
    static let titleFont: Font = .spaceGrotesk(size: 20,
                                               weight: .medium)
    static let titleColor = AppColor.Label.primary
}

#Preview {
    BadgePopupView(obtained: true, badge: .init(icon: AppImage.badgeTest,
                                name: "Aut Recusandae Dicta"))
}
