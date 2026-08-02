//
//  NeubrutProminentButtonStyle.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct NeubrutProminentButtonStyle: ButtonStyle {
    let kind: Kind
    let icon: Image?
    let isFullWidth: Bool
    
    @Environment(\.isEnabled) private var isEnabled
    
    enum Kind {
        case primary
        case secondary
        case neutral
        case info
        case success
        case warning
        case destructive
    }
    
    func makeBody(configuration: Configuration) -> some View {
        Group {
            if let icon {
                HStack(alignment: .center,
                       spacing: Styles.iconLabelSpacing) {
                    configuration.label
                        .font(Styles.labelFont)
                    
                    icon
                        .font(Styles.iconFont)
                }
            } else {
                configuration.label
                    .font(Styles.labelFont)
            }
        }
            .foregroundStyle(foreground(role: configuration.role))
            .padding(.horizontal, Styles.hPadding)
            .frame(height: Styles.height)
            .if(isFullWidth) { view in
                view
                    .frame(maxWidth: .infinity,
                           alignment: .center)
            }
            .background {
                Styles.shape
                    .fill(background(role: configuration.role))
                    .shadow(color: Styles.shadow,
                            radius: 0,
                            x: configuration.isPressed || !isEnabled
                            ? 0
                            : Styles.shadowSize,
                            y: configuration.isPressed || !isEnabled
                            ? 0
                            : Styles.shadowSize)
            }
            .overlay {
                Styles.shape
                    .strokeBorder(Styles.border,
                                  lineWidth: Styles.borderWidth)
            }
            .offset(x: configuration.isPressed && isEnabled
                    ? Styles.shadowSize
                    : 0,
                    y: configuration.isPressed && isEnabled
                    ? Styles.shadowSize
                    : 0)
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
        }
    }
}

extension ButtonStyle where Self == NeubrutProminentButtonStyle {
    
    static func neubrutProminent(kind: Self.Kind,
                                 icon: Image? = nil,
                                 isFullWidth: Bool = false) -> Self {
        Self(kind: kind,
             icon: icon,
             isFullWidth: isFullWidth)
    }
}

fileprivate struct Styles {
    
    static let pressedAnimation = AppToken.buttonPressedAnimation
    
    static let height = AppToken.buttonHeight
    static let hPadding = AppToken.Primitive.padding5
    
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
    static let disabled = AppColor.disabledBackground
    static let disabledForeground = AppColor.disabledLabel
    
    static let border = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let shadow = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    
    static let labelFont: Font = .system(size: 17,
                                         weight: .heavy,
                                         design: .default)
        .width(.expanded)
    
    static let iconFont: Font = .system(size: 17,
                                        weight: .heavy,
                                        design: .default)
    
    static let iconLabelSpacing: Double = 8
}

#Preview {
    VStack {
        Button("Vanille") {}
            .buttonStyle(.neubrutProminent(kind: .primary))
        
        Button("Vanille", role: .destructive, action: {})
            .buttonStyle(
                .neubrutProminent(kind: .primary,
                                  icon: Image(systemName: "trash"))
            )
        
        Button("Vanille") {}
            .buttonStyle(.neubrutProminent(kind: .secondary,
                                           isFullWidth: true))
        
        Button("Vanille") {}
            .buttonStyle(.neubrutProminent(kind: .primary))
            .disabled(true)
        
        Button("Vanille") {}
            .buttonStyle(
                .neubrutProminent(kind: .info,
                                  icon: Image(systemName: "info"),
                                  isFullWidth: true)
            )
    }
    .padding(32)
    .background(AppColor.background)
}
