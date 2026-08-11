//
//  RankingColInfo.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct RankingColInfo: View {
    let label: String
    let rank: (current: UInt, total: UInt)
    
    var body: some View {
        ColInfo(label: label) {
            HStack(alignment: .center,
                   spacing: Styles.hSpacing) {
                AppImage.Icon.trekRanking.image
                    .font(Styles.iconFont)
                    .foregroundStyle(Styles.iconColor)
                
                Text("\(rank.current)/\(rank.total)")
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
    RankingColInfo(label: "Classement",
                   rank: (current: 17,
                          total: 452))
}
