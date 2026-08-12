//
//  HistoryActiveScene.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import SwiftUI

struct HistoryActiveScene: View {
    //    let treks: [Trek] = [.CompletionData(date: Date), .name, .city, .department, .region]
    //    let sortedTreks = treks.sorted()
    //    let sortedAlpabet = treks.sorted(by: >)
    
    var body: some View {
        VStack{
           
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

#Preview {
    HistoryActiveScene()
}
