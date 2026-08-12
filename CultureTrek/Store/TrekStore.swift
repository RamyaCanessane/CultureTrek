//
//  TrekStore.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import Foundation

@Observable
final class TrekStore {
    
    var treks : [Trek] = []
    
    init(treks: [Trek] = Trek.examples) {
        self.treks = treks
    }
}
