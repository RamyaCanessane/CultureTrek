//
//  TrekListScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListScene: View {
    
    let sectionTitle : String
    let sectionTitleIcon : Image?
    let sectionTrekList : [Trek]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                                
                TrekListCell(treks: sectionTrekList)
                
            }
            
        }
        .neubrutTabViewVisibility(.hidden)
        .navigationBarBackButtonHidden(true)
        .safeAreaBar(edge: .top, content: {
            
            TrekListHeader(icon: sectionTitleIcon,title: sectionTitle)
            
        })
        .scrollIndicators(.hidden)
        .background(AppColor.Page.background)
    }
}

#Preview {
    TrekListScene(sectionTitle: TrekSection.userFavorites.name, sectionTitleIcon: TrekSection.userFavorites.icon, sectionTrekList: Trek.examples)
}
