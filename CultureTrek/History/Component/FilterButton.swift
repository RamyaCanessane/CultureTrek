//
//  FilterButton.swift
//  CultureTrek
//
//  Created by Apprenant162 on 07/08/2026.
//

import SwiftUI

struct FilterButton: View {
    let filterAction: () -> Void
    
    var body: some View {
<<<<<<< HEAD
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
=======
        VStack(alignment: .trailing){
            Button(action: filterAction){
                Image(systemName: FilterButtonStyles.filterIcon)
                    .font(FilterButtonStyles.iconFont)
//                    .foregroundStyle(FilterButtonStyles.iconColor)
                    .padding(FilterButtonStyles.padding)
                    .frame(width: FilterButtonStyles.buttonSize,
                           height: FilterButtonStyles.buttonSize)
                    .background(FilterButtonStyles.background)
                    .clipShape(FilterButtonStyles.shape)
                    .overlay {
                        FilterButtonStyles.shape
                            .strokeBorder(FilterButtonStyles.borderColor,
                                          lineWidth: FilterButtonStyles.borderWidth)
                    }
            }
            .buttonStyle(.neubrutIcon(kind: .neutral))
>>>>>>> feature/history
        }
    }
}

struct FilterButtonStyles {
    static let background = AppColor.accentNeutral
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let cornerRadius = AppToken.cornerRadius
    
<<<<<<< HEAD
    static let iconFont: Font = .system(
        size: buttonSize / 2,
        weight: .regular,
        design: .default
    )
=======
    static let iconFont: Font = .system(size: 20,
                                        weight: .heavy)
>>>>>>> feature/history
    static let padding = AppToken.Primitive.padding1
    
    static let shadowColor = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    
    static let shape = RoundedRectangle(
        cornerRadius: cornerRadius
    )
    static let buttonSize: Double = AppToken.buttonHeight
    static let filterIcon: String = "line.3.horizontal.decrease"
    static let iconColor = AppColor.Label.primary
}

#Preview {
    VStack {
<<<<<<< HEAD
        FilterButton(
            filterIcon: "line.3.horizontal.decrease"
        )
=======
        FilterButton(filterAction: {})
>>>>>>> feature/history
    }
    .padding()
    .background(
        AppColor.background
    )
}
