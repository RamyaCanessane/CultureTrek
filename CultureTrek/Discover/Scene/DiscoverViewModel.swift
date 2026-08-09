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
    var section1 : TrekSection = TrekSection(name: TrekSection.aroundUser.name, icon: TrekSection.aroundUser.icon, treks: [])
    var section2 : TrekSection = TrekSection(name: TrekSection.userFavorites.name, icon: TrekSection.userFavorites.icon, treks: [])
    var section3 : TrekSection = TrekSection(name: TrekSection.parisSecrets.name, icon: TrekSection.parisSecrets.icon, treks: [])
    var section4 : TrekSection = TrekSection(name: TrekSection.alongMarne.name, icon: TrekSection.alongMarne.icon, treks: [])
    
    //Données
    var store : TrekStore
    
    init() {
        self.store = TrekStore()
    }
    
    //Sortie pour affichage
    var user : User = User.example

    var around : [Trek] {
        //store.treks.filter({$0.city == user.location})
        store.treks
    }
    
    var favorites : [Trek] {
        store.treks.filter({$0.isLiked})
    }
    
    var paris : [Trek] {
        store.treks.filter({$0.city.lowercased() == "Paris".lowercased()})
    }
    
    var marne : [Trek] {
        store.treks.filter({$0.region.lowercased() == "Val-de-Marne".lowercased()})
    }
    
    //Intention
    func getAllTreks(){
        store.addMoreTreks(Trek.examples)
    }
    
    func fillTrekSections(){

        section1.treks = around
        section2.treks = favorites
        section3.treks = paris
        section4.treks = marne
        
        store.addSections([section1, section2, section3, section4])
    }
    
}
