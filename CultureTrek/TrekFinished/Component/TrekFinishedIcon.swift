//
//  TrekFinishedIcon.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedIcon: View {
    var body: some View {
        Image(systemName: "flag.fill")
            .resizable()
            .scaledToFit()
            .fontWeight(Styles.iconWeight)
            .frame(width: Styles.iconSize,
                   height: Styles.iconSize)
            .foregroundStyle(Styles.iconBelowColor)
            .overlay {
                Image(systemName: "flag.pattern.checkered")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(Styles.iconWeight)
                    .frame(width: Styles.iconSize,
                           height: Styles.iconSize)
                    .foregroundStyle(Styles.iconAboveColor)
            }
            .frame(width: Styles.size,
                   height: Styles.size)
            .background {
                Styles.shape
                    .fill(Styles.background)
            }
            .overlay {
                Styles.shape
                    .strokeBorder(Styles.border,
                                  lineWidth: Styles.borderWidth)
            }
    }
}

fileprivate enum Styles {
    
    static let size: Double = 128
    static let shape = Circle()
    static let background = AppColor.success
    static let border = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let iconSize: Double = 80
    static let iconWeight: Font.Weight = .semibold
    static let iconBelowColor: Color = .white
    static let iconAboveColor: Color = AppColor.Label.primary
}

#Preview {
    TrekFinishedIcon()
}
