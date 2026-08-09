//
//  DiscoverSection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI

struct DiscoverSection: View {
    
    let section : TrekSection
    
    var body: some View {
        
        VStack(spacing : Styles.sectionSpacing){
            
            NavigationLink {
                TrekListScene(sectionTitle: section.name, sectionTitleIcon: section.icon, sectionTrekList: section.treks)
            } label: {
                DiscoverSectionTitle(icon: section.icon, title: section.name)
            }
            
            DiscoverSectionCells(treks: section.treks)
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let sectionSpacing = AppToken.Primitive.spacing2
    
}

#Preview {
    DiscoverSection(section: TrekSection.userFavorites)
}
