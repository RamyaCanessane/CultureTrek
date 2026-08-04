//
//  AppToken.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 01/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

enum AppToken {

    static let shadowSize: Double = 4
    static let shadowSizeMini: Double = 3
    static let cornerRadius: Double = Primitive.radiusXS
    static let borderWidth: Double = 2
    static let popupBorderWidth: Double = 4
    static let buttonHeight: Double = 48
    static let buttonPressedAnimation = Animation.snappy

    enum Primitive {
        // Padding
        static let padding0: Double = 0
        static let padding1: Double = 4
        static let padding2: Double = 8
        static let padding3: Double = 12
        static let padding4: Double = 16
        static let padding5: Double = 20
        static let padding6: Double = 24
        static let padding8: Double = 32
        static let padding10: Double = 40
        static let padding12: Double = 48
        static let padding16: Double = 64
        static let padding20: Double = 80
        
        // Radius
        static let radiusNone: Double = 0
        static let radiusXS: Double = 2
        static let radiusSM: Double = 4
        static let radiusMD: Double = 6
        static let radiusLG: Double = 8
        static let radiusXL: Double = 12
        static let radius2XL: Double = 16
        static let radius3XL: Double = 20
        static let radius4XL: Double = 24
        static let radius5XL: Double = 32
        static let radiusFull: Double = 9999
        
        // Spacing
        static let spacing0: Double = 0
        static let spacing1: Double = 4
        static let spacing2: Double = 8
        static let spacing3: Double = 12
        static let spacing4: Double = 16
        static let spacing5: Double = 20
        static let spacing6: Double = 24
        static let spacing8: Double = 32
        static let spacing10: Double = 40
        static let spacing12: Double = 48
        static let spacing16: Double = 64
        static let spacing20: Double = 80
    }
}

