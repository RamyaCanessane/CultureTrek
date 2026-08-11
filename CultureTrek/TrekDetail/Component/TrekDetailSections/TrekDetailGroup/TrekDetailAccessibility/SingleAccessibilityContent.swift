//
//  SingleAccessibilityContent.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import SwiftUI

struct SingleAccessibilityContent: View {
    
    let icon : Image
    let name : String
    
    var body: some View {
        
        VStack(spacing: Styles.accessibilityInfoSpacing) {
            
            icon
                .font(.system(size: Styles.accessibilityIconFontSize))
                .frame(width: Styles.accessibilityIconSize, height: Styles.accessibilityIconSize)
                .background{
                    
                    RoundedRectangle(cornerRadius: Styles.accessibilityInfoCornerRadius)
                        .fill(Styles.accessibilityInfoBackground)
                        .strokeBorder(Styles.accessibilityInfoBorder, lineWidth: Styles.accessibilityInfoBoderWidth)
                    
                }
            
            Text(name)
                .font(.spaceGrotesk(size: Styles.accessibilityLabelFontSize, weight: .medium))
        }
        .foregroundStyle(Styles.accessibilityInfoForeground)
        
    }
}

fileprivate struct Styles {
    
    static let accessibilityInfoForeground = AppColor.Label.primary
    static let accessibilityInfoBackground = AppColor.accentNeutral
    static let accessibilityInfoBorder = AppColor.border
    
    static let accessibilityInfoBoderWidth = AppToken.borderWidth
    static let accessibilityInfoCornerRadius = AppToken.cornerRadius
    static let accessibilityInfoSpacing = AppToken.Primitive.padding2
    
    static let accessibilityIconSize = CGFloat(56)
    static let accessibilityIconFontSize = CGFloat(24)
    
    static let accessibilityLabelFontSize = CGFloat(17)
    
}

#Preview {
    SingleAccessibilityContent(icon: AppImage.Icon.accessibilityBike.image, name: "Vélo")
}
