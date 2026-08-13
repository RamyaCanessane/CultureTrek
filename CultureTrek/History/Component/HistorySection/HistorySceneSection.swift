//
//  HistorySceneSection.swift
//  CultureTrek
//
//  Created by Apprenant162 on 09/08/2026.
//

import SwiftUI

struct HistorySceneSection: View {
    @State var sectionOption: FilterButton.Option = .date
    
    let treks: [Trek]
    
    var body: some View {
        ScrollView {
            HistorySceneTitle(sceneTitle: Text(""))
            ForEach(
                treks
            ) { trek in
                NavigationLink {
                    TrekDetailScene(
                        trek: trek
                    )
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
            }
        }
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
        city: "Paris",
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
        region: "Ile-de-Beauté",
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
        city: "New York",
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
        region: "Far fro here",
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
        city: "Vincennes",
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
        region: "My region",
        summary: nil
    )
]

fileprivate enum HistoryMapStyles {
    static let background = AppColor.accentPrimary // ou Secondary
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    static let cornerRadius = AppToken.cornerRadius
    static let fillColor = Color.black
    static let shape = RoundedRectangle(
        cornerRadius: 99
    )
}


#Preview {
    @Previewable @State var sectionOption: FilterButton.Option = .date
    
    NavigationStack{
        HistorySceneSection(
            treks: trekList
        )
    }
    .padding()
    .background(
        AppColor.Page.background
    )
}
