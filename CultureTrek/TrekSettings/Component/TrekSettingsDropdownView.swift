//
//  TrekSettingsDropdownView.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekSettingsDropdownView: View {
    let label: String
    
    var body: some View {
        HStack(alignment: .center,
               spacing: Styles.hSpacing) {
            Text(label)
                .font(Styles.labelFont)
                .foregroundStyle(Styles.labelColor)
            
            AppImage.Icon.dropdownDisclosure.image
                .font(Styles.iconFont)
                .foregroundStyle(Styles.iconColor)
        }
               .padding(.horizontal, Styles.hPadding)
               .padding(.vertical, Styles.vPadding)
               .background {
                   Styles.shape
                       .fill(Styles.background)
               }
               .overlay {
                   Styles.shape
                       .strokeBorder(Styles.borderColor,
                                     lineWidth: Styles.borderWidth)
               }
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing2
    static let hPadding = AppToken.Primitive.padding3
    static let vPadding = AppToken.Primitive.padding2
    
    static let background = AppColor.accentNeutral
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    
    static let labelFont: Font = .spaceGrotesk(size: 17,
                                               weight: .medium)
    static let labelColor = AppColor.Label.primary
    
    static let iconFont: Font = .spaceGrotesk(size: 15,
                                              weight: .medium)
    static let iconColor = AppColor.Label.primary
}

#Preview {
    TrekSettingsDropdownView(label: "Est Uty")
        .padding(40)
        .background(AppColor.background)
}
