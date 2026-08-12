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
    static let qrCodeTest = Image(.qrCodeTest)
    static let heroTestPicture = Image(.heroTestPicture)
    static let trekTestPicture = Image(.trekTestPicture)
    
    static let xpPointsIcon = Image(.xpPointsIcon)
    
    enum Icon {
        case accessibilityBike
        case accessibilityStroller
        case accessibilityWalk
        case accessibilityWheelchair
        case close
        case distance
        case dropdownDisclosure
        case download
        case sceneBack
        case elevation
        case riddle
        case riddleCompletedTitlePrefix
        case riddleClue
        case riddleTime
        case riddlePath
        case riddleBack
        case riddleNext
        case riddleClose
        case popupValid
        case popupInvalid
        case popupClue
        case trekDuration
        case trekRanking
        case trekFinishedMapPattern
        case trekUnliked
        case trekLiked
        case trekSectionForward
        case openCamera
        case openPhotoLibrary
        
        var systemName: String {
            switch self {
            case .accessibilityBike:
                "bicycle"
            case .accessibilityWalk:
                "figure.walk"
            case .accessibilityWheelchair:
                "wheelchair"
            case .accessibilityStroller:
                "stroller"
            case .close:
                "xmark"
            case .distance:
                "point.bottomleft.forward.to.point.topright.filled.scurvepath"
            case .dropdownDisclosure:
                "chevron.down"
            case .download:
                "arrow.down.to.line"
            case .sceneBack:
                "chevron.backward"
            case .elevation:
                "righttriangle.fill"
            case .riddle:
                "flag.fill"
            case .riddleCompletedTitlePrefix:
                "checkmark.square.fill"
            case .riddleClue:
                "lightbulb.max.fill"
            case .riddleTime:
                "stopwatch"
            case .riddlePath:
                "map"
            case .riddleBack:
                "arrow.left"
            case .riddleNext:
                "arrow.right"
            case .riddleClose:
                "xmark"
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
            case .trekUnliked:
                "heart"
            case .trekLiked:
                "heart.fill"
            case .trekSectionForward:
                "chevron.forward"
            case .openCamera:
                "camera"
            case .openPhotoLibrary:
                "photo.on.rectangle.angled"
            }
        }
        
        var image: Image {
            Image(systemName: systemName)
        }
    }
    
    enum Badge {
        case distanceLv1
        case distanceLv2
        case distanceLv3
        case distanceLv4
        case distanceLv5
        case durationLv1
        case durationLv2
        case durationLv3
        case durationLv4
        case durationLv5
        case paname
        
        var name: String {
            switch self {
            case .distanceLv1:
                "distanceLv1"
            case .distanceLv2:
                "distanceLv2"
            case .distanceLv3:
                "distanceLv3"
            case .distanceLv4:
                "distanceLv4"
            case .distanceLv5:
                "distanceLv5"
            case .durationLv1:
                "durationLv1"
            case .durationLv2:
                "durationLv2"
            case .durationLv3:
                "durationLv3"
            case .durationLv4:
                "durationLv4"
            case .durationLv5:
                "durationLv5"
            case .paname:
                "paname"
            }
        }
        
        var image: Image {
            Image(name)
        }
    }
}
