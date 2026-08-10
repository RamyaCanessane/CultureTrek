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
    
    init(treks: [Trek] = Trek.examples) {
        self.treks = treks
    }
    
//    func addTrek(_ trek: Trek){
//        treks.append(trek)
//    }
    
//    func addMoreTreks(_ treksToAdd: [Trek]){
//        treks.append(contentsOf: treksToAdd)
//    }
    
}
