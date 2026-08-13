//
//  HistoryViewModel.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import SwiftUI

@Observable
final class HistoryViewModel {
    
    private var treks: [Trek]
    var filterOption: FilterButton.Option

    init(treks: [Trek]) {
        self.treks = treks
        self.filterOption = .date
    }
}


