//
//  Trek.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

struct Trek {
    let accessibility: Accessibility
    let badgesToUnlock: [Badge]
    let city: String
    let completion: CompletionData?
    let department: String?
    let distance: Measurement<UnitLength>
    let duration: Duration
    let elevation: Elevation
    let goal: String?
    let goodToKnow: [String]
    let isLiked: Bool
    let name: String
    let riddles: [Riddle]
    let quizQuestions: [QuizQuestion]
    let region: String
    let riddleCount: Int
    let summary: String? // description
    
    enum Elevation {
        case low
        case medium
        case high
    }
    
    struct Accessibility {
        let bike: Bool
        let stroller: Bool
        let walking: Bool
        let wheelchair: Bool
    }
    
    struct CompletionData {
        let duration: Duration
        let earnedPoints: UInt
        let photos: [String] // TODO: to update
        let unlockedBadges: [Badge]
    }
}
