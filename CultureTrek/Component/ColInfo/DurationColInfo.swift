//
//  DurationColInfo.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct DurationColInfo: View {
    let label: String
    let duration: Duration
    
    var body: some View {
        ColInfo(label: label) {
            HStack(alignment: .center,
                   spacing: Styles.hSpacing) {
                AppImage.Icon.trekDuration.image
                    .font(Styles.iconFont)
                    .foregroundStyle(Styles.iconColor)
                
                Text(duration.formatted(.units(width: .condensedAbbreviated)))
                    .font(Styles.labelFont)
                    .foregroundStyle(Styles.labelColor)
            }
        }
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing2
    
    static let iconFont: Font = .system(size: 15,
                                        weight: .medium)
    static let iconColor = AppColor.iconAccent
    
    static let labelFont: Font = .spaceGrotesk(size: 15,
                                               weight: .medium)
    static let labelColor = AppColor.Label.primary
}

#Preview {
    DurationColInfo(label: "Durée",
                    duration: Duration.seconds(1 * 60 * 60 + 5 * 60                         ))
}
