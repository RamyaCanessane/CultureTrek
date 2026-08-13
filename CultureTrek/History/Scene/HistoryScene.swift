//
//  HistoryScene.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import SwiftUI
import CoreLocation

struct HistoryScene: View {
    
    @State private var vm: HistoryViewModel
    
    init(treks: [Trek]) {
        self._vm = State(initialValue: HistoryViewModel(treks: treks))
    }
    
    var body: some View {
        Group {
            if vm.tabState == .first {
                List {
                    ForEach(vm.sortedTreks, id: \.title) { item in
                        Section {
                            ForEach(item.treks) { trek in
                                TrekCell(
                                    city: trek.city,
                                    department: trek.department,
                                    name: trek.name,
                                    picture: trek.picture,
                                    region: trek.region,
                                    isBig: true
                                )
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(.vertical, 8)
                            }
                        } header: {
                            Text(item.title)
                        }
                        .headerProminence(.increased)
                    }
                }
                .listStyle(.plain)
                .background(AppColor.Page.background)
            } else {
                HistoryMap(treks: vm.treks)
            }
        }
        .safeAreaInset(edge: .top) {
            HistorySceneHeader(
                firstTab: "Liste",
                secondTab: "Carte",
                tabState: $vm.tabState,
                filterOption: $vm.filterOption
            )
        }
        .sceneHeader("Historique")
    }
}

/*
fileprivate let trekList: [Trek] = [
    Trek(
        accessibility: .init(
            bike: false,
            stroller: false,
            walking: false,
            wheelchair: false
        ),
        badgesToUnlock: [],
        city: "",
        completion: nil,
        department: nil,
        distance: .init(
            value: 1,
            unit: UnitLength.kilometers
        ),
        duration:
                .seconds(
                    3600
                ),
        elevation: .low,
        goal: nil,
        goodToKnow: [],
        isLiked: true,
        name: "Hôtel de Ville",
        picture: Image(
            .trekTestPicture
        ),
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(
                    latitude: 48.8566,
                    longitude: 2.3522
                ),
                goodToKnow: nil,
                isCompleted: true,
                order: 1,
                picture: nil,
                photos: [],
                summary: "",
                validationPoints: 0
            )
        ],
        quizQuestions: [],
        region: "",
        summary: nil
    ),
    Trek(
        accessibility: .init(
            bike: false,
            stroller: false,
            walking: false,
            wheelchair: false
        ),
        badgesToUnlock: [],
        city: "",
        completion: nil,
        department: nil,
        distance: .init(
            value: 1,
            unit: UnitLength.kilometers
        ),
        duration:
                .seconds(
                    3600
                ),
        elevation: .low,
        goal: nil,
        goodToKnow: [],
        isLiked: true,
        name: "Tour Eiffel",
        picture: Image(
            .trekTestPicture
        ),
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(
                    latitude: 48.8584,
                    longitude: 2.2945
                ),
                goodToKnow: nil,
                isCompleted: true,
                order: 1,
                picture: nil,
                photos: [],
                summary: "",
                validationPoints: 0
            )
        ],
        quizQuestions: [],
        region: "",
        summary: nil
    ),
    Trek(
        accessibility: .init(
            bike: false,
            stroller: false,
            walking: false,
            wheelchair: false
        ),
        badgesToUnlock: [],
        city: "",
        completion: nil,
        department: nil,
        distance: .init(
            value: 1,
            unit: UnitLength.kilometers
        ),
        duration:
                .seconds(
                    3600
                ),
        elevation: .low,
        goal: nil,
        goodToKnow: [],
        isLiked: true,
        name: "Musée du Louvre",
        picture: Image(
            .trekTestPicture
        ),
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(
                    latitude: 48.8606,
                    longitude: 2.3376
                ),
                goodToKnow: nil,
                isCompleted: true,
                order: 1,
                picture: nil,
                photos: [],
                summary: "",
                validationPoints: 0
            )
        ],
        quizQuestions: [],
        region: "",
        summary: nil
    )
]
 */

#Preview {
    HistoryScene(treks: Trek.liveDemoHistoryExamples)
}
