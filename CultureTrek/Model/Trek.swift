//
//  Trek.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

class Trek : Identifiable {
    let id = UUID()
    
    let accessibility: Accessibility
    let badgesToUnlock: [Badge]
    let city: String
    let completion: CompletionData?
    let department: String?
    let distance: Measurement<UnitLength>
    let duration: Duration
    let elevation: Elevation
    let goal: String?
    let goodToKnow: [String]
    let isLiked: Bool
    let name: String
    let picture: Image
    let riddles: [Riddle]
    let quizQuestions: [QuizQuestion]
    let region: String
    let summary: String? // description
    
    var coordinate: CLLocationCoordinate2D {
        riddles.first?.coordinate ?? .init(latitude: 0, longitude: 0)
    }

    init(accessibility: Accessibility, badgesToUnlock: [Badge], city: String, completion: CompletionData?, department: String?, distance: Measurement<UnitLength>, duration: Duration, elevation: Elevation, goal: String?, goodToKnow: [String], isLiked: Bool, name: String, picture: Image, riddles: [Riddle], quizQuestions: [QuizQuestion], region: String, summary: String?) {
        self.accessibility = accessibility
        self.badgesToUnlock = badgesToUnlock
        self.city = city
        self.completion = completion
        self.department = department
        self.distance = distance
        self.duration = duration
        self.elevation = elevation
        self.goal = goal
        self.goodToKnow = goodToKnow
        self.isLiked = isLiked
        self.name = name
        self.picture = picture
        self.riddles = riddles
        self.quizQuestions = quizQuestions
        self.region = region
        self.summary = summary
    }
    
    enum Elevation {
        case low
        case medium
        case high
    }
    
    struct Accessibility {
        let bike: Bool
        let stroller: Bool
        let walking: Bool
        let wheelchair: Bool
    }
    
    struct CompletionData {
        let duration: Duration
        let earnedPoints: UInt
        let photos: [String] // TODO: to update
        let unlockedBadges: [Badge]
    }
}

#warning("Mettre l'unité dans les Trek.distance")

extension Trek {
    
    static let example = Trek(
        accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
        badgesToUnlock: Badge.examples,
        city: "Paris",
        completion: nil,
        department: nil,
        distance: .init(value: 2.4, unit: UnitLength.kilometers),
        duration: .seconds((60*60)+(20*60)),
        elevation: .low,
        goal: "Delectus quod inventore dolores impedit nulla aliquid vel voluptas in non.",
        goodToKnow: ["Rerum ut vitae suscipit expedita aliquam odit.", "Veniam et quo", "Excepturi et quos quam"],
        isLiked: true,
        name: "Numquam natus nam deleniti",
        picture: AppImage.trekTestPicture,
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
                goodToKnow: "",
                isCompleted: true,
                order: 1,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            ),
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
                goodToKnow: "",
                isCompleted: false,
                order: 2,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            )
        ],
        quizQuestions: QuizQuestion.examples,
        region: "Île-de-France",
        summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt."
    )
    
    static let example2 = Trek(
        accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
        badgesToUnlock: Badge.examples,
        city: "Paris",
        completion: nil,
        department: nil,
        distance: .init(value: 2.4, unit: .init(forLocale: .autoupdatingCurrent, usage: .road)),
        duration: .seconds((60*60)+(20*60)),
        elevation: .low,
        goal: "Delectus quod inventore dolores impedit nulla aliquid vel voluptas in non.",
        goodToKnow: ["Rerum ut vitae suscipit expedita aliquam odit.", "Veniam et quo", "Excepturi et quos quam"],
        isLiked: true,
        name: "Numquam natus nam deleniti",
        picture: AppImage.trekTestPicture,
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3499),
                goodToKnow: "",
                isCompleted: true,
                order: 1,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            ),
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
                goodToKnow: "",
                isCompleted: false,
                order: 2,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            )
        ],
        quizQuestions: QuizQuestion.examples,
        region: "Île-de-France",
        summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt."
    )
    
    static let example3 = Trek(
        accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
        badgesToUnlock: Badge.examples,
        city: "Paris",
        completion: nil,
        department: nil,
        distance: .init(value: 2.4, unit: .init(forLocale: .autoupdatingCurrent, usage: .road)),
        duration: .seconds((60*60)+(20*60)),
        elevation: .low,
        goal: "Delectus quod inventore dolores impedit nulla aliquid vel voluptas in non.",
        goodToKnow: ["Rerum ut vitae suscipit expedita aliquam odit.", "Veniam et quo", "Excepturi et quos quam"],
        isLiked: true,
        name: "Numquam natus nam deleniti",
        picture: AppImage.trekTestPicture,
        riddles: [
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
                goodToKnow: "",
                isCompleted: true,
                order: 1,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            ),
            .init(
                clue: nil,
                coordinate: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3499),
                goodToKnow: "",
                isCompleted: false,
                order: 2,
                picture: AppImage.riddleTestPicture,
                photos: [],
                summary: "",
                validationPoints: 10
            )
        ],
        quizQuestions: QuizQuestion.examples,
        region: "Île-de-France",
        summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt."
    )
    
    static let examples = [Trek.example, Trek.example2, Trek.example3]
    
}
