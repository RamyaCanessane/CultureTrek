//
//  HistoryViewModel.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import SwiftUI

@Observable
final class HistoryViewModel {
    
    var treks: [Trek]
    var filterOption: FilterButton.Option
    var tabState: NeubrutTabPicker.TabState

    init(treks: [Trek]) {
        self.treks = treks
        self.filterOption = .date
        self.tabState = .first
    }
    
    var sortedTreks: [(title: String, treks: [Trek])] {
        switch filterOption {
        case .date:
            sortedTreksByDate
        case .city:
            sortedTreksByCity
        case .department:
            sortedTreksByDepartment
        }
    }
    
    private var sortedTreksByDate: [(title: String, treks: [Trek])] {
        let grouped = Dictionary(grouping: treks, by: { $0.completion?.date ?? .now })
        
        let mapped: [(title: String, treks: [Trek])] = grouped.map {
            ($0.key, $0.value)
        }
            .sorted(by: { $0.0 > $1.0 })
            .map({ ($0.0.formatted(date: .complete, time: .omitted), $0.1) })
        
        return mapped
    }
    
    private var sortedTreksByCity: [(title: String, treks: [Trek])] {
        let grouped = Dictionary(grouping: treks, by: { $0.city + "_" + ($0.department ?? "") })
        
        let mapped: [(title: String, treks: [Trek])] = grouped.map {
            let first = $0.value.first
            var text = "-"
            
            if let first {
                text = "\(first.city) • \(first.department ?? first.region)"
            }
            
            return (text, $0.value)
        }
        
        return mapped.sorted(by: { $0.title < $1.title })
    }
    
    private var sortedTreksByDepartment: [(title: String, treks: [Trek])] {
        let grouped = Dictionary(grouping: treks, by: { $0.department ?? ($0.city + " • \($0.region)") })
        let mapped: [(title: String, treks: [Trek])] = grouped.map {
            ($0.key, $0.value)
        }
        
        return mapped.sorted(by: { $0.title < $1.title })
    }
 }


