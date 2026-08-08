//
//  TrekStore.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import Foundation

@Observable
class TrekStore : Identifiable {
    
    var treks : [Trek] = []
    
    var heroTrek : Trek = Trek.example
    
    func add(_ trek: Trek){
        treks.append(trek)
    }
    
    func addMoreTreks(_ treksToAdd: [Trek]){
        treks.append(contentsOf: treksToAdd)
    }
    
}
