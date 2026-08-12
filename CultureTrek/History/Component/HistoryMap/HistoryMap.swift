//
//  HistoryMap.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import MapKit
import SwiftUI

struct HistoryMap: View {
    let treks: [Trek]
    let firstTab: String
    let secondTab: String
    
    @State private var state : TabState = .first
    
    var body: some View {
        Map {
            ForEach(
                treks
            ){ trek in
                Annotation(
                    trek.name,
                    coordinate: trek.coordinate
                ) {
                    Image(
                        systemName: "flag.pattern.checkered"
                    )
                    .foregroundStyle(
                        HistoryMapStyles.fillColor
                    )
                    .onTapGesture {
//                       NavigationLink{}
                    }
                    .frame(
                        width: 40,
                        height: 40
                    )
                    .background(
                        HistoryMapStyles.background,
                        in: .circle
                    )
                    .clipShape(
                        HistoryMapStyles.shape
                    )
                    .overlay {
                        HistoryMapStyles.shape
                            .strokeBorder(
                                HistoryMapStyles.borderColor,
                                lineWidth: HistoryMapStyles.borderWidth
                            )
                    }
                }
            }
        }
        .overlay(
            alignment: .topLeading
        ) {
            NeubrutTabPicker(
                nameFirstTab: firstTab,
                nameSecondTab: secondTab,
                state: $state
            )
            .frame(
                width: 212,
                height: 100
            )
            .padding()
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
    HistoryMap(
        treks: trekList,
        firstTab: "Liste",
        secondTab: "Carte"
    )
}
