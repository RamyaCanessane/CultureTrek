//
//  LevelCalculator.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 07/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

final class LevelCalculator {
    
    struct ProgressBarData {
        let currentLevel: Level
        let nextLevel: Level?
        let currentPoints: UInt
        let newPoints: UInt
        let totalPoints: UInt
        let remainingPoints: UInt
    }
    
    static func getProgressBarData(currentXPPoints: UInt, newXPPoints: UInt) -> ProgressBarData? {
        let sumOfPoints = currentXPPoints + newXPPoints
        
        let currentLevel = getCurrentLevel(forPoints: sumOfPoints)
        let nextLevel = currentLevel.next
        
        if let nextLevel,
           let totalPoints = currentLevel.currentRange {
            let remainingPoints = nextLevel.requiredPoints - sumOfPoints
            
            if currentXPPoints >= currentLevel.requiredPoints {
                let newPoints = newXPPoints
                let currentPointsInLevel = currentXPPoints - currentLevel.requiredPoints
                
                return .init(
                    currentLevel: currentLevel,
                    nextLevel: nextLevel,
                    currentPoints: currentPointsInLevel,
                    newPoints: newPoints,
                    totalPoints: totalPoints,
                    remainingPoints: remainingPoints
                )
            } else {
                let newPoints = sumOfPoints - currentLevel.requiredPoints
                
                return .init(
                    currentLevel: currentLevel,
                    nextLevel: nextLevel,
                    currentPoints: 0,
                    newPoints: newPoints,
                    totalPoints: totalPoints,
                    remainingPoints: remainingPoints
                )
            }
        } else {
            return nil
        }
    }
    
    private static func getCurrentLevel(forPoints points: UInt) -> Level {
        for level in Level.allSorted.reversed() {
            if points >= level.requiredPoints {
                return level
            }
        }
        
        return Level.allSorted.first ?? .wood
    }
}
