//
//  AppStore.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 12/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

@Observable
final class AppStore {
    
    var user: User
    
    init(user: User = .example) {
        self.user = user
    }
}
