//
//  HistoryUniversalScene.swift
//  CultureTrek
//
//  Created by Apprenant162 on 10/08/2026.
//

import SwiftUI

struct HistoryUniversalScene: View {
    let mainTitle: Text
    let tabOne: String
    let tabTwo: String
    let treks: [Trek]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(
                    spacing: AppToken.Primitive.spacing6
                ) {
                    
                    HistorySceneTitle(
                        sceneTitle: mainTitle
                    )
                    
                    HistorySceneHeadler(
                        firstTab: tabOne,
                        secondTab: tabTwo
                    )
                    
                    ForEach(
                        sortedTreks,
                        id: \.name
                    ) { trek in
                        HistorySceneSection(
                            sectionTitle: sectionTitle(
                                for: trek
                            ),
                            city: trek.city,
                            department: trek.department ?? "",
                            name: trek.name,
                            picture: trek.picture,
                            region: trek.region
                        )
                    }
                }
            }
            .background(
                AppColor.Page.background
            )
        }
    }
    
    private var sortedTreks: [Trek] {
        treks
            .sorted {
                let date0 = $0.completion?.date ?? .distantPast
                let date1 = $1.completion?.date ?? .distantPast
                
                if date0 != date1 {
                    return date0 > date1
                }

                if $0.city != $1.city {
                    return $0.city < $1.city
                }

                let department0 = $0.department ?? ""
                let department1 = $1.department ?? ""
                
                if department0 != department1 {
                    return department0 < department1
                }
                return $0.region < $1.region
            }
    }
    
    private func sectionTitle(
        for trek: Trek
    ) -> Text {
        if let date = trek.completion?.date {
            return Text(
                date
                    .formatted(
                        .dateTime
                            .day()
                            .month(
                                .wide
                            )
                            .year()
                    )
            )
        }
        
        return Text(
            "Date inconnue"
        )
    }
}

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

#Preview {
    HistoryUniversalScene(
        mainTitle: Text(
            "History"
        ),
        tabOne: "Kiso",
        tabTwo: "Miso",
        treks: trekList
    )
    .padding()
    .background(
        AppColor.Page.background
    )
}
