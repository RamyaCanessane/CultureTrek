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
    var section1 : (name: String, icon: Image?, treks: [Trek]) = (name: "", icon: nil, treks: [])
    var section2 : (name: String, icon: Image?, treks: [Trek]) = (name: "", icon: nil, treks: [])
    var section3 : (name: String, icon: Image?, treks: [Trek]) = (name: "", icon: nil, treks: [])
    var section4 : (name: String, icon: Image?, treks: [Trek]) = (name: "", icon: nil, treks: []) 
    
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
        section1 = (name: TrekSection.aroundUser.name, icon: nil, treks: around)
        section2 = (name: TrekSection.userFavorites.name, icon: TrekSection.userFavorites.icon, treks: favorites)
        section3 = (name: TrekSection.parisSecrets.name, icon: nil, treks: paris)
        section4 = (name: TrekSection.alongMarne.name, icon: nil, treks: marne)
    }
    
}
