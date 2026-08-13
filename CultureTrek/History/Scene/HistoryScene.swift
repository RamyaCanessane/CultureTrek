//
//  HistoryScene.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import SwiftUI
import CoreLocation

struct HistoryScene: View {
    
    @Environment(TrekStore.self) private var store
    
    var body: some View {
        HistorySceneInternal(treks: store.historyTreks)
    }
}

struct HistorySceneInternal: View {
    
    @State private var vm: HistoryViewModel
    
    init(
        treks: [Trek]
    ) {
        self._vm = State(
            initialValue: HistoryViewModel(
                treks: treks
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.tabState == .first {
                    listView
                } else {
                    mapView
                }
            }
        }
    }
    
    private var mapView: some View {
        HistoryMap(
            treks: vm.treks
        )
        .safeAreaInset(
            edge: .top
        ) {
            HistorySceneHeader(
                firstTab: "Liste",
                secondTab: "Carte",
                tabState: $vm.tabState,
                filterOption: $vm.filterOption
            )
            .padding(.horizontal)
        }
        .sceneHeader(
            "Historique"
        )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var listView: some View {
        List {
            ForEach(
                vm.sortedTreks,
                id: \.title
            ) { item in
                Section {
                    ForEach(
                        item.treks
                    ) { trek in
                        NavigationLink {
                            TrekDetailScene(trek: trek)
                        } label: {
                            TrekCell(
                                city: trek.city,
                                department: trek.department,
                                name: trek.name,
                                picture: trek.picture,
                                region: trek.region,
                                isBig: true
                            )
                        }
                        .navigationLinkIndicatorVisibility(.hidden)
                        .listRowBackground(
                            Color.clear
                        )
                        .listRowSeparator(
                            .hidden
                        )
                        .listRowInsets(
                            .vertical,
                            8
                        )
                    }
                } header: {
                    Text(
                        item.title
                    )
                }
                .headerProminence(
                    .increased
                )
            }
        }
        .listStyle(
            .plain
        )
        .background(
            AppColor.Page.background
        )
        .safeAreaInset(
            edge: .top
        ) {
            HistorySceneHeader(
                firstTab: "Liste",
                secondTab: "Carte",
                tabState: $vm.tabState,
                filterOption: $vm.filterOption
            )
            .padding(.horizontal)
        }
        .sceneHeader(
            "Historique"
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var trekStore = TrekStore(treks: Trek.liveDemoExamples,
                                                  historyTreks: Trek.liveDemoHistoryExamples)
    @Previewable @State var appStore = AppStore()
    
    HistoryScene()
    .environment(trekStore)
    .environment(appStore)
}
