//
//  CultureTrekApp.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 29/07/2026.
//

import SwiftUI

@main
struct CultureTrekApp: App {
    let trekStore = TrekStore()
    let appStore = AppStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(trekStore)
                .environment(appStore)
        }
    }
}
