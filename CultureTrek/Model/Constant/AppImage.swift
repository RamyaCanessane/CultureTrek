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
    
    enum Icon {
        case riddleCompletedTitlePrefix
        case riddleClue
        
        var systemName: String {
            switch self {
            case .riddleCompletedTitlePrefix:
                "checkmark.square.fill"
            case .riddleClue:
                "lightbulb.max.fill"
            }
        }
        
        var image: Image {
            Image(systemName: systemName)
        }
    }
}
