//
//  TrekSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct TrekSection {
    
    let name : String
    let icon : Image?
    
}

extension TrekSection {
    
    static let aroundUser = TrekSection(name: "Autour de toi", icon: nil)
    
    static let userFavorites = TrekSection(name: "Tes favoris", icon : AppImage.Icon.trekLiked.image)
    
    static let parisSecrets = TrekSection(name: "Paris et ses secrets", icon : nil)
    
    static let alongMarne = TrekSection(name: "Le long de la Marne", icon : nil)
    
}
