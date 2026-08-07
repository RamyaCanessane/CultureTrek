//
//  DiscoverSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI

struct DiscoverSection: View {
    
    let sectionTitle : String
    var sectionIcon : Image?
    let sectionTreks : [Trek]
    
    var body: some View {
        
        VStack(spacing : Styles.sectionSpacing){
            
            DiscoverSectionTitle(icon: sectionIcon, title: sectionTitle)
            
            DiscoverSectionCells(treks: sectionTreks)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let sectionSpacing = AppToken.Primitive.spacing2
    
}

#Preview {
    DiscoverSection(sectionTitle: "Autour de toi", sectionIcon: nil, sectionTreks: Trek.examples)
}
