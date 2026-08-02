//
//  Font+extension.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

extension Font {
    
    enum SpaceGroteskWeight {
        case light
        case regular
        case medium
        case semibold
        case bold
    }
    
    static func spaceGrotesk(size: Double,
                             weight: SpaceGroteskWeight) -> Font {
        switch weight {
        case .light:
                .custom("SpaceGrotesk-Light",
                        size: size)
        case .regular:
                .custom("SpaceGrotesk-Regular",
                        size: size)
        case .medium:
                .custom("SpaceGrotesk-Medium",
                        size: size)
        case .semibold:
                .custom("SpaceGrotesk-SemiBold",
                        size: size)
        case .bold:
                .custom("SpaceGrotesk-Bold",
                        size: size)
        }
    }
}
