//
//  DiscoverViewModel.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import Foundation
import SwiftUI

@Observable
final class DiscoverViewModel {
    
    //Etat de l'écran
    var section1 : TrekSection = TrekSection.aroundUser
    var section2 : TrekSection = TrekSection.userFavorites
    var section3 : TrekSection = TrekSection.alongMarne
    var section4 : TrekSection = TrekSection.parisSecrets
    
    //Données
    var store : TrekStore
    
    init(store: TrekStore) {
        self.store = store
        
        fillTrekSections()
    }

    var sections : [TrekSection] = []
    
    var heroTrek : Trek {
        store.treks.first{ $0.name == "Les Hauteurs de Belleville" } ?? Trek.example
    }
   
    //Sortie pour affichage
    var user : User = User.liveDemoExample

    var around : [Trek] {
        store.treks.filter(
            {
                DistanceCalculator.calculateDistance(from: $0.coordinate, to: user.coordinate) < Measurement(
                    value: 5.0,
                    unit: .kilometers
                )
            })
    }
    
    var favorites : [Trek] {
        store.treks.filter({$0.isLiked})
    }
    
    var paris : [Trek] {
        store.treks
            .filter({$0.city.lowercased() == "Paris".lowercased()})
    }
    
    var marne : [Trek] {
        store.treks
            .filter({ $0.city.lowercased().contains("Marne".lowercased()) })
    }
    
    //Intention
    private func fillTrekSections(){

        section1.treks = around
        section2.treks = favorites
        section3.treks = marne
        section4.treks = paris
        
        sections = [section1, section2, section3, section4]
    }
    
}
