//
//  CompletedTrekDetailInfoViewModel.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import Foundation
import SwiftUI

@Observable
final class CompletedTrekDetailInfoViewModel {
    
    //Etat de l'écran
    let durationSection = CompletionDataContent.duration
    let pointsSection = CompletionDataContent.points

    //Données
    var kind : CompletionDataContent? = nil
    
    //Intention
    enum CompletionDataContent : String {
        case duration = "Durée du parcours"
        case points = "Points obtenus"
        
        var icon : Image? {
            
            switch self {
            case .duration:
                return AppImage.Icon.trekDuration.image
            case .points:
                return AppImage.xpPointsIcon
            }
            
        }
    }
    
}
