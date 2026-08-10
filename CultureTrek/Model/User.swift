//
//  User.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import SwiftUI

struct User {
    let coordinate: CLLocationCoordinate2D
    let currentXPPoints: UInt
    let firstName: String
    let lastName: String
    let picture: Image
}

extension User {
    static let example = User(
        coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        currentXPPoints: 15,
        firstName: "Lena",
        lastName: "Villamore",
        picture: AppImage.heroTestPicture
    )
}

extension User {
    
    func getNameInitials() -> String{
        let firstInitial = self.firstName.first!.uppercased()
        let secondInitial = self.lastName.first!.uppercased()
        
        return firstInitial + secondInitial
    }
}
