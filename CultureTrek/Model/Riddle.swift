//
//  Riddle.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

struct Riddle: Identifiable {
    let id = UUID()
    let clue: String?
    let coordinate: CLLocationCoordinate2D
    let goodToKnow: String?
    var isCompleted: Bool
    let order: UInt
    let picture: Image?
    var photos: [UIImage]
    let summary: String // description
    let validationPoints: UInt
}

extension Riddle {
    
    static let examples: [Riddle] = [
        .init(clue: "Delectus nihil itaque quia a similique tempora illum et omnis ipsum quisquam.",
              coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
              goodToKnow: "Repellat est ipsa dignissimos voluptatem et ea eaque vel debitis est.",
              isCompleted: false,
              order: 1,
              picture: Image(.riddleTestPicture),
              photos: [],
              summary: "Repudiandae atque adipisci dolores maxime esse voluptatem eveniet sunt similique eius tenetur delectus eum quo. Laboriosam error nulla voluptatum nemo nisi temporibus aut sunt.",
              validationPoints: 10), // Tour Eiffel
        .init(clue: nil,
              coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
              goodToKnow: "Repellendus dolor eum consequatur magnam consectetur et neque quidem.",
              isCompleted: false,
              order: 2,
              picture: nil,
              photos: [],
              summary: "Omnis dolores molestias cum voluptas quod reprehenderit tempore labore et architecto in assumenda.",
              validationPoints: 20), // Musée du Louvre
        .init(clue: "Illo voluptatem rerum esse id nihil eum tenetur.",
              coordinate: CLLocationCoordinate2D(latitude: 48.8530, longitude: 2.3499),
              goodToKnow: "Est sit laudantium dicta mollitia ea consequatur provident qui minima et totam voluptate aliquid. Qui vero aut modi dignissimos ipsa mollitia quod.",
              isCompleted: false,
              order: 3,
              picture: Image(.riddleTestPicture),
              photos: [],
              summary: "Qui sed quis nulla libero nam et nesciunt adipisci. Quaerat voluptatem ut animi aliquam nostrum et labore.",
              validationPoints: 30) // Notre-Dame de Paris
    ]
}
