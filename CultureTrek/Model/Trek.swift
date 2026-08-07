//
//  Trek.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct Trek : Identifiable {
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

extension Trek {
    
    static let example = Trek(accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
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
                              riddles: [.init(clue: nil, goodToKnow: "", isCompleted: true, order: 1, picture: AppImage.riddleTestPicture, summary: ""), .init(clue: nil, goodToKnow: "", isCompleted: false, order: 2, picture: AppImage.riddleTestPicture, summary: "")],
                              quizQuestions: QuizQuestion.examples,
                              region: "Île-de-France",
                              summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt.")
    
    static let example2 = Trek(accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
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
                              riddles: [.init(clue: nil, goodToKnow: "", isCompleted: true, order: 1, picture: AppImage.riddleTestPicture, summary: ""), .init(clue: nil, goodToKnow: "", isCompleted: false, order: 2, picture: AppImage.riddleTestPicture, summary: "")],
                              quizQuestions: QuizQuestion.examples,
                              region: "Île-de-France",
                              summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt.")
    
    static let example3 = Trek(accessibility: .init(bike: true, stroller: true, walking: true, wheelchair: true),
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
                              riddles: [.init(clue: nil, goodToKnow: "", isCompleted: true, order: 1, picture: AppImage.riddleTestPicture, summary: ""), .init(clue: nil, goodToKnow: "", isCompleted: false, order: 2, picture: AppImage.riddleTestPicture, summary: "")],
                              quizQuestions: QuizQuestion.examples,
                              region: "Île-de-France",
                              summary: "Et quasi ad aut omnis eligendi. Est deserunt ducimus maxime id omnis sed velit numquam nihil. Dolorem consequatur natus facere totam beatae error distinctio sunt.")
    
    static let examples = [Trek.example, Trek.example2, Trek.example3]
    
}
