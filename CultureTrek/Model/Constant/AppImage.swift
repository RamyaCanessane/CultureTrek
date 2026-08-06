//
//  AppIcon.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

enum AppImage {
    
    static let riddleTestPicture = Image(.riddleTestPicture)
    static let badgeTest = Image(.badgeTest)
    
    static let heroTestPicture = Image(.heroTestPicture)
    static let trekTestPicture = Image(.trekTestPicture)
    
    static let xpPointsIcon = Image(.xpPointsIcon)
    
    enum Icon {
        case riddleCompletedTitlePrefix
        case riddleClue
        case riddleTime
        case riddleMap
        case riddleBack
        case riddleNext
        case popupValid
        case popupInvalid
        case popupClue
        case trekDuration
        case trekRanking
        case trekFinishedMapPattern
        
        var systemName: String {
            switch self {
            case .riddleCompletedTitlePrefix:
                "checkmark.square.fill"
            case .riddleClue:
                "lightbulb.max.fill"
            case .riddleTime:
                "stopwatch"
            case .riddleMap:
                "map"
            case .riddleBack:
                "arrow.left"
            case .riddleNext:
                "arrow.right"
            case .popupValid:
                "checkmark.circle"
            case .popupInvalid:
                "xmark.circle"
            case .popupClue:
                "lightbulb.max.fill"
            case .trekDuration:
                "stopwatch"
            case .trekRanking:
                "crown"
            case .trekFinishedMapPattern:
                "point.topright.arrow.triangle.backward.to.point.bottomleft.filled.scurvepath"
            }
        }
        
        var image: Image {
            Image(systemName: systemName)
        }
    }
}
