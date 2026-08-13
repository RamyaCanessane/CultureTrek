//
//  User.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

@Observable
class User: CustomStringConvertible {
    let coordinate: CLLocationCoordinate2D
    var currentXPPoints: UInt
    let firstName: String
    let lastName: String
    let picture: Image
    
    init(
        coordinate: CLLocationCoordinate2D,
        currentXPPoints: UInt,
        firstName: String,
        lastName: String,
        picture: Image
    ) {
        self.coordinate = coordinate
        self.currentXPPoints = currentXPPoints
        self.firstName = firstName
        self.lastName = lastName
        self.picture = picture
    }
    
    func addXPPoints(_ points: UInt) {
        currentXPPoints += points
    }
    
    var description: String {
        "User: \(firstName) \(lastName) with \(currentXPPoints) XP points"
    }
}

extension User {
    static let example = User(
        coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        currentXPPoints: 300,
        firstName: "Lena",
        lastName: "Villamore",
        picture: AppImage.heroTestPicture
    )
    
    static let liveDemoExample: User = .init(coordinate: CLLocationCoordinate2D(latitude: 48.848222, longitude: 2.395925),
                                             currentXPPoints: 4105,
                                             firstName: "Sasha",
                                             lastName: "Lima",
                                             picture: AppImage.heroTestPicture)
}

extension User {
    
    func getNameInitials() -> String{
        let firstInitial = self.firstName.first!.uppercased()
        let secondInitial = self.lastName.first!.uppercased()
        
        return firstInitial + secondInitial
    }
}
