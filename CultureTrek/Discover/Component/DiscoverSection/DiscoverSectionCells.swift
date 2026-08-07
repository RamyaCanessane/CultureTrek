//
//  DiscoverSectionCells.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI

struct DiscoverSectionCells: View {

    let rows = [
        GridItem(.fixed(Styles.gridCellSize), spacing: Styles.gridCellHorizontalSpacing),
        GridItem(.fixed(Styles.gridCellSize)),
    ]
    
    let treks : [Trek]
    
    var body: some View {
        
        ScrollView(.horizontal){
            
            LazyHGrid(rows: rows, alignment: .center, spacing: Styles.gridCellVerticalSpacing){
                
                ForEach(treks) { trek in
                    
                    TrekCell(city: trek.city, department: trek.department, name: trek.name, picture: trek.picture, region: trek.region, isBig: true)
                    
                }
                
            }
            .padding(.horizontal, Styles.gridCellHorizontalPadding)
        }
        .frame(height: Styles.gridHeight)
        .scrollIndicators(.hidden)
        
    }
}

fileprivate struct Styles {
    
    static let gridCellSize = CGFloat(80)
    static let gridCellHorizontalPadding = AppToken.Primitive.spacing4
    static let gridCellHorizontalSpacing = AppToken.Primitive.spacing3
    static let gridCellVerticalSpacing = AppToken.Primitive.spacing3
    
    static let gridHeight = (gridCellSize * 2) + gridCellVerticalSpacing
    
}

#Preview {
    DiscoverSectionCells(treks: Trek.examples)
}
