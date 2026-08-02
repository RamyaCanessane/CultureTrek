//
//  View+extension.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

extension View {
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool,
                             transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
