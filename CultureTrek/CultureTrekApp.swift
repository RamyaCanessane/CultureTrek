//
//  CultureTrekApp.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 29/07/2026.
//

import SwiftUI

@main
struct CultureTrekApp: App {
    
    @State private var trekStore = TrekStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(trekStore)
        }
    }
}
