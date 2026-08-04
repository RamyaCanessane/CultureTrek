//
//  RiddleTime.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleTime: View {
    let duration: Duration
    
    var body: some View {
        HStack(alignment: .center,
               spacing: Styles.spacing) {
            AppImage.Icon.riddleTime.image
                .font(Styles.iconFont)
                .foregroundStyle(Styles.iconColor)
            
            Text(duration.formatted(.units(width: .abbreviated)))
                .font(Styles.labelFont)
                .foregroundStyle(Styles.labelColor)
        }
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing2
    
    static let iconFont: Font = .system(size: 20,
                                        weight: .semibold)
    static let iconColor = AppColor.iconAccent
    
    static let labelFont: Font = .spaceGrotesk(size: 20,
                                               weight: .semibold)
    static let labelColor = AppColor.Label.primary
}

#Preview {
    RiddleTime(duration: .seconds(12 * 60 + 27))
}
