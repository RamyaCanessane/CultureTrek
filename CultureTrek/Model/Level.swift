//
//  Level.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 07/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

enum Level: CaseIterable {
    case wood
    case stone
    case crystal
    case bronze
    case silver
    case gold
    case emerald
    case sapphire
    case ruby
    case diamond
    case mithril
    case adamantium
    
    var order: UInt {
        switch self {
        case .wood:
            1
        case .stone:
            2
        case .crystal:
            3
        case .bronze:
            4
        case .silver:
            5
        case .gold:
            6
        case .emerald:
            7
        case .sapphire:
            8
        case .ruby:
            9
        case .diamond:
            10
        case .mithril:
            11
        case .adamantium:
            12
        }
    }
    
    var name: String {
        switch self {
        case .wood:
            "Bois"
        case .stone:
            "Pierre"
        case .crystal:
            "Cristal"
        case .bronze:
            "Bronze"
        case .silver:
            "Argent"
        case .gold:
            "Or"
        case .emerald:
            "Émeraude"
        case .sapphire:
            "Saphir"
        case .ruby:
            "Ruby"
        case .diamond:
            "Diamant"
        case .mithril:
            "Mithril"
        case .adamantium:
            "Adamantium"
        }
    }
    
    static var allSorted: [Level] {
        Level
            .allCases
            .sorted(by: { $0.order < $1.order})
    }
    
    var next: Level? {
        let levels = Level.allSorted
        
        guard let index = levels.firstIndex(where: { $0 == self }),
              index + 1 < levels.count else {
            return nil
        }
        
        let newIndex = index + 1
        
        return levels[newIndex]
    }
    
    var requiredPoints: UInt {
        switch self {
        case .wood: return 0
        case .stone: return 100
        case .crystal: return 250
        case .bronze: return 500
        case .silver: return 1000
        case .gold: return 2000
        case .emerald: return 4000
        case .sapphire: return 7000
        case .ruby: return 12000
        case .diamond: return 20000
        case .mithril: return 35000
        case .adamantium: return 60000
        }
    }
    
    var currentRange: UInt? {
        if let next {
            next.requiredPoints - self.requiredPoints
        } else {
            nil
        }
    }
}
