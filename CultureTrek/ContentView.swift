//
//  ContentView.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 29/07/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NeubrutTabView {
            NeubrutTab(activeIcon: AppTab.discover.activeIcon,
                       inactiveIcon: AppTab.discover.inactiveIcon) {
                AppTab.discover.rootView
            }
            
            NeubrutTab(activeIcon: AppTab.history.activeIcon,
                       inactiveIcon: AppTab.history.inactiveIcon) {
                AppTab.history.rootView
            }
            
            NeubrutTab(activeIcon: AppTab.ranking.activeIcon,
                       inactiveIcon: AppTab.ranking.inactiveIcon) {
                AppTab.ranking.rootView
            }
            
            NeubrutTab(activeIcon: AppTab.achievement.activeIcon,
                       inactiveIcon: AppTab.achievement.inactiveIcon) {
                AppTab.achievement.rootView
            }
            
            NeubrutTab(activeIcon: AppTab.search.activeIcon,
                       inactiveIcon: AppTab.search.inactiveIcon) {
                AppTab.search.rootView
            }
        }
    }
}

#Preview {
    let trekStore = TrekStore()
    
    ContentView()
        .environment(trekStore)
}
