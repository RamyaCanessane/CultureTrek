//
//  TrekPathMarker.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 11/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekPathMarker: View {
    let riddle: Riddle
    let kind: Kind
    
    enum Kind {
        case first
        case last
        case other
    }
    
    var body: some View {
        Text("\(riddle.order)")
            .font(Styles.labelFont)
            .foregroundStyle(Styles.foreground)
            .frame(width: Styles.size,
                   height: Styles.size)
            .background(background,
                        in: Styles.shape)
            .overlay {
                Styles.shape
                    .strokeBorder(Styles.borderColor,
                                  lineWidth: Styles.borderWidth)
            }
    }
    
    private var background: Color {
        switch kind {
        case .first:
            Styles.firstBackground
        case .last:
            Styles.lastBackground
        case .other:
            Styles.otherBackground
        }
    }
}

fileprivate enum Styles {
    
    static let shape = Circle()
    static let size: Double = 32
    
    static let foreground = AppColor.Label.primary
    
    static let firstBackground = AppColor.accentSecondary
    static let lastBackground = AppColor.accentPrimary
    static let otherBackground = AppColor.accentNeutral
    
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let labelFont: Font = .spaceGrotesk(size: 18,
                                               weight: .bold)
}

#Preview {
    HStack(spacing: 16) {
        TrekPathMarker(riddle: .examples.first!,
                       kind: .first)
        
        TrekPathMarker(riddle: .examples.first!,
                       kind: .other)
        
        TrekPathMarker(riddle: .examples.first!,
                       kind: .last)
    }
}
