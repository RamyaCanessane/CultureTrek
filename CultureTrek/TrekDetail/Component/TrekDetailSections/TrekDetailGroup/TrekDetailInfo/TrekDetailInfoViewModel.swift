//
//  TrekDetailInfoViewModel.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import Foundation
import SwiftUI

@Observable
final class TrekDetailInfoViewModel {
    
    //Etat de l'écran
    let distanceSection = TrekDetailInfoContent.distance
    let durationSection = TrekDetailInfoContent.duration
    let elevationSection = TrekDetailInfoContent.elevation
    let riddlesSection = TrekDetailInfoContent.riddles

    //Données
    var kind : TrekDetailInfoContent? = nil
    
    init(kind: TrekDetailInfoContent? = nil) {
        self.kind = kind
    }
    
    //Intention
    enum TrekDetailInfoContent : String {
        case distance = "Distance"
        case duration = "Durée"
        case elevation = "Dénivelé"
        case riddles = "Énigmes"
        
        var icon : Image? {
            
            switch self {
            case .distance:
                return AppImage.Icon.distance.image
            case .elevation:
                return AppImage.Icon.elevation.image
            case .riddles:
                return AppImage.Icon.riddle.image
            default :
                return nil
            }
            
        }
    }
    
}
