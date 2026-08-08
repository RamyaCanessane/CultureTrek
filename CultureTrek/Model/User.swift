//
//  User.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct User {
    let currentXPPoints: UInt
    let firstName: String
    let lastName: String
    let picture: Image
}

extension User {
    static let example = User(currentXPPoints: 15, firstName: "Lena", lastName: "Villamore", picture: AppImage.heroTestPicture)
}
