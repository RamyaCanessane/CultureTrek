//
//  NeubrutIconButtonStyle.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 01/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct NeubrutIconButtonStyle: ButtonStyle {
    let kind: Kind
    
    @Environment(\.isEnabled) private var isEnabled
    
    enum Kind {
        case primary
        case secondary
        case neutral
        case info
        case success
        case warning
        case destructive
        case liked
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Styles.labelFont)
            .foregroundStyle(foreground(role: configuration.role))
            .frame(width: Styles.size,
                   height: Styles.size)
            .background {
                Styles.shape
                    .fill(background(role: configuration.role))
            }
            .overlay {
                Styles.shape
                .strokeBorder(Styles.borderColor,
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
                        .frame(width: Styles.size,
                               height: Styles.size)
                        .padding([.leading, .top], Styles.shadowSize * 2)
                }
            }
            .animation(Styles.pressedAnimation,
                       value: configuration.isPressed)
    }
    
    private func foreground(role: ButtonRole?) -> Color {
        if !isEnabled {
            return Styles.disabledForeground
        } else if role == .destructive {
            return Styles.label
        }
        
        switch kind {
        case .primary,
             .secondary,
             .neutral,
             .info,
             .success,
             .warning,
             .destructive:
            return Styles.label
        case .liked:
            return Styles.likedForeground
        }
    }
    
    private func background(role: ButtonRole?) -> Color {
        if !isEnabled {
            return Styles.disabled
        } else if role == .destructive {
            return Styles.destructive
        }
        
        switch kind {
        case .primary:
            return Styles.primary
        case .secondary:
            return Styles.secondary
        case .neutral:
            return Styles.neutral
        case .info:
            return Styles.info
        case .success:
            return Styles.success
        case .warning:
            return Styles.warning
        case .destructive:
            return Styles.destructive
        case .liked:
            return Styles.liked
        }
    }
}

extension ButtonStyle where Self == NeubrutIconButtonStyle {
    
    static func neubrutIcon(kind: Self.Kind) -> Self {
        Self(kind: kind)
    }
}

fileprivate struct Styles {
    
    static let pressedAnimation = AppToken.buttonPressedAnimation
    
    static let size = AppToken.buttonHeight
    
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    
    static let label = AppColor.Label.primary
    static let primary = AppColor.accentPrimary
    static let secondary = AppColor.accentSecondary
    static let neutral = AppColor.accentNeutral
    static let info = AppColor.info
    static let success = AppColor.success
    static let warning = AppColor.warning
    static let destructive = AppColor.error
    static let liked = AppColor.likedBackground
    static let likedForeground = AppColor.likedForeground
    static let disabled = AppColor.disabledBackground
    static let disabledForeground = AppColor.disabledLabel
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let shadowColor = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    
    static let labelFont: Font = .system(size: size / 2,
                                         weight: .regular,
                                         design: .default)
}

#Preview {
    VStack {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            
            Button(role: .destructive, action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .secondary))
            
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            .disabled(true)
            
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .info))
        }
    }
}
