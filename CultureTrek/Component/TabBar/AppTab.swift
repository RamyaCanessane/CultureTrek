//
//  AppTab.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 10/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

enum AppTab: String, Identifiable {
    case discover
    case history
    case ranking
    case achievement
    case search
    
    var id: String {
        rawValue
    }
    
    var activeIcon: Image {
        switch self {
        case .discover:
            Image(.tabDiscoverOn)
        case .history:
            Image(.tabHistoryOn)
        case .ranking:
            Image(.tabRankingOn)
        case .achievement:
            Image(.tabAchievementOn)
        case .search:
            Image(.tabSearchOn)
        }
    }
    
    var inactiveIcon: Image {
        switch self {
        case .discover:
            Image(.tabDiscoverOff)
        case .history:
            Image(.tabHistoryOff)
        case .ranking:
            Image(.tabRankingOff)
        case .achievement:
            Image(.tabAchievementOff)
        case .search:
            Image(.tabSearchOff)
        }
    }
    
    @ViewBuilder
    var rootView: some View {
        switch self {
        case .discover:
            DiscoverScene()
        case .history:
            HistoryScene()
        case .ranking:
            Text("Ranking scene")
                .frame(maxWidth: .infinity)
        case .achievement:
            Text("Achievement scene")
                .frame(maxWidth: .infinity)
        case .search:
            Text("Search scene")
                .frame(maxWidth: .infinity)
        }
    }
}
