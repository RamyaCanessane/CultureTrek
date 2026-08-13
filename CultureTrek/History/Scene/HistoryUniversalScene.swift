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
                    
//                    ForEach(
//                        sortedTreks,
//                        id: \.name
//                    ) { trek in
//                        HistorySceneSection(
//                            sectionTitle: sectionTitle(
//                                for: trek
//                            ),
//                            city: trek.city,
//                            department: trek.department ,
//                            name: trek.name,
//                            picture: trek.picture,
//                            region: trek.region
//                        )
//                    }
                }
            }
            .background(
                AppColor.Page.background
            )
        }
    }
}
//
//    private var sortedTreks: [Trek] {
//        treks
//            .sorted {
////mettre par date, ville etc
//            }
//    }

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
    )
    .padding()
    .background(
        AppColor.Page.background
    )
}
