//
//  FilterButton.swift
//  CultureTrek
//
//  Created by Apprenant162 on 07/08/2026.
//

import SwiftUI

struct FilterButton: View {
    let filterIcon: String
    
    var body: some View {
        icon: do {
            Image(
                systemName: filterIcon
            )
            .font(
                FilterButtonStyles.iconFont
            )
            .foregroundStyle(
                FilterButtonStyles.iconColor
            )
            .padding(
                FilterButtonStyles.padding
            )
            .frame(
                width: FilterButtonStyles.buttonSize,
                height: FilterButtonStyles.buttonSize
            )
            .background(
                FilterButtonStyles.background
            )
            .clipShape(
                FilterButtonStyles.shape
            )
            .overlay {
                FilterButtonStyles.shape
                    .strokeBorder(
                        FilterButtonStyles.borderColor,
                        lineWidth: FilterButtonStyles.borderWidth
                    )
            }
        }
    }
}

struct FilterButtonStyles {
    static let background = AppColor.accentNeutral
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let cornerRadius = AppToken.cornerRadius
    
    static let iconFont: Font = .system(
        size: buttonSize / 2,
        weight: .regular,
        design: .default
    )
    static let padding = AppToken.Primitive.padding1
    
    static let shadowColor = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    
    static let shape = RoundedRectangle(
        cornerRadius: cornerRadius
    )
    static let buttonSize: Double = AppToken.buttonHeight
    
    static let iconColor = AppColor.Label.primary
}

#Preview {
    VStack {
        FilterButton(
            filterIcon: "line.3.horizontal.decrease"
        )
    }
    .padding()
    .background(
        AppColor.background
    )
}
