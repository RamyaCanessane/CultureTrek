//
//  TrekFinishedPointsColInfo.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedPointsColInfo: View {
    let label: String
    let points: UInt
    
    var body: some View {
        TrekFinishedColInfo(label: label) {
            HStack(alignment: .center,
                   spacing: Styles.hSpacing) {
                AppImage.xpPointsIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: Styles.iconSize,
                           height: Styles.iconSize)
                
                Text("\(points) points")
                    .font(Styles.labelFont)
                    .foregroundStyle(Styles.labelColor)
            }
        }
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing2
    
    static let iconSize: Double = 20
    
    static let labelFont: Font = .spaceGrotesk(size: 15,
                                               weight: .medium)
    static let labelColor = AppColor.Label.primary
}

#Preview {
    TrekFinishedPointsColInfo(label: "Points",
                              points: 152)
}
