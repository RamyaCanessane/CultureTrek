//
//  TrekPlayFormat.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

extension Trek {
    enum PlayFormat: String, Identifiable, CaseIterable {
        case solo
        case group
        
        var id: String {
            rawValue
        }
        
        var name: String {
            switch self {
            case .solo: 
                "Solo"
            case .group: 
                "Groupe"
            }
        }
        
        var summary: String? {
            switch self {
            case .solo:
                nil
            case .group:
                "Pour partager ce jeu de piste, fais tes amis scanner ce code QR."
            }
        }
    }
}
