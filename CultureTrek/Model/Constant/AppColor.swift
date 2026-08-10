//
//  AppColor.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 01/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

enum AppColor {
    
    static let accentNeutral: Color = .primitiveAccentNeutral
    static let accentPrimary: Color = .primitiveAccentPrimary
    static let accentSecondary: Color = .primitiveAccentSecondary
    static let background: Color = .primitiveBackground
    static let border: Color = .primitiveBorder
    static let clue: Color = .primitiveClue
    static let disabledBackground: Color = .primitiveDisabledBackground
    static let disabledLabel: Color = .primitiveDisabledLabel
    static let error: Color = .primitiveError
    static let info: Color = .primitiveInfo
    static let iconAccent: Color = .primitiveIconAccent
    static let inverseBackground: Color = .primitiveInverseBackground
    static let inverseForegroundPrimary: Color = .primitiveInverseForegroundPrimary
    static let inverseForegroundSecondary: Color = .primitiveInverseForegroundSecondary
    static let likedBackground: Color = .primitiveLikedBackground
    static let likedForeground: Color = .primitiveLikedForeground
    static let popupBadAnswerBackground: Color = .primitivePopupBadAnswerBackground
    static let popupBadAnswerForeground: Color = .primitivePopupBadAnswerForeground
    static let popupGoodAnswerBackground: Color = .primitivePopupGoodAnswerBackground
    static let popupGoodAnswerForeground: Color = .primitivePopupGoodAnswerForeground
    static let xpPoints: Color = .primitiveXpPoints
    static let shadow: Color = .primitiveShadow
    static let success: Color = .primitiveSuccess
    static let tabViewBackground: Color = .primitiveTabViewBackground
    static let warning: Color = .primitiveWarning
    
    enum Page {
        static let background: Color = AppColor.background
    }
    
    enum Label {
        static let primary: Color = .labelPrimary
        static let secondary: Color = .labelSecondary
    }
}
