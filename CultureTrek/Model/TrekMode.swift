//
//  TrekMode.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

extension Trek {
    enum Mode: String, Identifiable, CaseIterable {
        case casual
        case ranked
        
        var id: String {
            rawValue
        }
        
        var name: String {
            switch self {
            case .casual:
                "Découverte"
            case .ranked:
                "Challenge"
            }
        }
        
        var summary: String {
            switch self {
            case .casual:
                "En mode découverte, il n’y a pas de chronomètre, de points d’expérience gagnés, ni de classement."
            case .ranked:
                "En mode challenge, il y a un chronomètre, des points à gagnés et un classement final."
            }
        }
    }
}
