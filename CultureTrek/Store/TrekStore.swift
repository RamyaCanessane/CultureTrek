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
    var historyTreks : [Trek] = []
    
    init(treks: [Trek] = Trek.examples,
         historyTreks: [Trek] = Trek.liveDemoHistoryExamples) {
        self.treks = treks
        self.historyTreks = historyTreks
    }
}
