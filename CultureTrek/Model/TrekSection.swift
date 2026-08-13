//
//  TrekSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

@Observable
final class TrekSection : Identifiable {
    let id = UUID()
    
    let name : String
    let icon : Image?
    var treks : [Trek]
    
    init(name: String, icon: Image?, treks: [Trek] = []) {
        self.name = name
        self.icon = icon
        self.treks = treks
    }
    
}

extension TrekSection {
    
    static let aroundUser = TrekSection(name: "Autour de toi", icon: nil)
    
    static let userFavorites = TrekSection(name: "Tes favoris", icon : AppImage.Icon.trekLiked.image)
    
    static let parisSecrets = TrekSection(name: "Paris et ses secrets", icon : nil)
    
    static let alongMarne = TrekSection(name: "Le long de la Marne", icon : nil)
    
}
