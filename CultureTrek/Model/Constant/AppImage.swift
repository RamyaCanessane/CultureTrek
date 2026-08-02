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
        
        var systemName: String {
            switch self {
            case .riddleCompletedTitlePrefix:
                "checkmark.square.fill"
            }
        }
        
        var image: Image {
            Image(systemName: systemName)
        }
    }
}
