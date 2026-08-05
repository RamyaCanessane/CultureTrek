//
//  NeubrutHeroButtonStyle.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct NeubrutHeroButtonStyle: ButtonStyle {
    let icon: Image
    let kind: Kind

    enum Kind {
        case primary
        case secondary
        case neutral
    }
    
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Styles.labelFont)
            .foregroundStyle(foreground)
            .frame(height: Styles.height)
            .padding(.horizontal, Styles.hPadding)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .background(alignment: .trailing) {
                FixedPattern(icon: icon)
                    .frame(width: Styles.height * 1.1,
                           height: Styles.height,
                           alignment: .center)
                    .clipShape(
                        UnevenRoundedRectangle(topLeadingRadius: 0,
                                               bottomLeadingRadius: 0,
                                               bottomTrailingRadius: Styles.cornerRadius,
                                               topTrailingRadius: Styles.cornerRadius)
                    )
                    .overlay {
                        UnevenRoundedRectangle(topLeadingRadius: 0,
                                               bottomLeadingRadius: 0,
                                               bottomTrailingRadius: Styles.cornerRadius,
                                               topTrailingRadius: Styles.cornerRadius)
                        .fill(
                            LinearGradient(colors: [
                                background.opacity(1),
                                background.opacity(0.8),
                                background.opacity(0.64),
                                background.opacity(0),
                                background.opacity(0),
                                background.opacity(0),
                            ],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                    }
            }
            .background {
                Styles.shape
                    .fill(background)
            }
            .overlay {
                Styles.shape
                    .strokeBorder(borderColor,
                                  lineWidth: Styles.borderWidth)
            }
            .offset(x: configuration.isPressed && isEnabled
                    ? Styles.shadowSize
                    : 0,
                    y: configuration.isPressed && isEnabled
                    ? Styles.shadowSize
                    : 0)
            .background {
                if isEnabled {
                    Styles.shape
                        .fill(Styles.shadowColor)
                        .frame(height: Styles.height)
                        .padding(.leading,
                                 Styles.shadowSize)
                        .padding(.top, Styles.shadowSize * 2)
                        .padding(.trailing, -Styles.shadowSize)
                        .padding(.bottom, 0)
                }
            }
            .animation(Styles.pressedAnimation,
                       value: configuration.isPressed)
//            .padding(50)
//            .background {
//                Rectangle()
//                    .foregroundStyle(.image(
//                        icon
//                    ))
//                    .font(.system(size: 50))
//            }
    }
    
    private var borderColor: Color {
        if !isEnabled {
            return Styles.disabledForeground
        } else {
            return Styles.borderColor
        }
    }
    
    private var foreground: Color {
        if !isEnabled {
            return Styles.disabledForeground
        }
        
        switch kind {
        case .primary,
             .secondary,
             .neutral:
            return Styles.label
        }
    }
    
    var background: Color {
        if !isEnabled {
            return Styles.disabled
        }
        
        switch kind {
        case .primary:
            return Styles.primary
        case .secondary:
            return Styles.secondary
        case .neutral:
            return Styles.neutral
        }
    }
}

fileprivate struct FixedPattern: View {
    let icon: Image
    
    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<6, id: \.self) { vIndex in
                HStack(spacing: 1) {
                    ForEach(0..<6, id: \.self) { hIndex in
                        icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: Styles.iconSize,
                                   height: Styles.iconSize,
                                   alignment: .center)
                            .foregroundStyle(Styles.iconColor)
                    }
                }
                .offset(x: vIndex.isMultiple(of: 2) ? Styles.iconSize / 2 : 0)
            }
        }
    }
}

fileprivate enum Styles {
    
    static let pressedAnimation = AppToken.buttonPressedAnimation
    
    static let height: Double = 72
    static let hPadding: Double = 16
    
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let shadowColor = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    
    static let labelFont: Font = .system(size: 20,
                                         weight: .heavy)
        .width(.expanded)
    static let label = AppColor.Label.primary
    
    static let primary = AppColor.accentPrimary
    static let secondary = AppColor.accentSecondary
    static let neutral = AppColor.accentNeutral
    static let disabled = AppColor.disabledBackground
    static let disabledForeground = AppColor.disabledLabel
    
    static let iconSize: Double = 18
    static let iconColor = AppColor.Label.primary
}

#Preview {
    FixedPattern(icon: Image(systemName: "book.pages"))
}

#Preview {
    VStack {
        Button("Temporibus commodi eveniet") {}
            .buttonStyle(NeubrutHeroButtonStyle(icon: Image(systemName: "book.pages"),
                                                kind: .primary))
        
        Button("Vitae quia") {}
            .buttonStyle(NeubrutHeroButtonStyle(icon: Image(systemName: "point.bottomleft.filled.forward.to.point.topright.scurvepath"),
                                                kind: .secondary))
        
        Button("Consectetur eos") {}
            .buttonStyle(NeubrutHeroButtonStyle(icon: Image(systemName: "questionmark.circle.dashed"),
                                                kind: .neutral))
    }
    .padding()
}
