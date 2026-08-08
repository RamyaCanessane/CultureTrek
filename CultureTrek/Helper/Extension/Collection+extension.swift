//
//  Collection+extension.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 06/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var isNotEmpty: Bool {
        !isEmpty
    }
}
