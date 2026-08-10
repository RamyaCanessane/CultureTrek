//
//  TrekListCells.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListCell: View {
    
    let treks : [Trek]
    
    var body: some View {
        
            VStack(spacing: Styles.listCellSpacing){
                ForEach(treks) { trek in
                    
                    TrekCell(city: trek.city, department: trek.department, name: trek.name, picture: trek.picture, region: trek.region, isBig: true)
                    
                }
            }
            .padding(.horizontal, Styles.listCellHorizontalPadding)
            .padding(.vertical, Styles.listCellVerticalPadding)
            
        }
    
}

fileprivate struct Styles {
    
    static let listCellSpacing = AppToken.Primitive.padding3
    
    static let listCellHorizontalPadding = AppToken.Primitive.padding4
    static let listCellVerticalPadding = AppToken.Primitive.padding6
    
    
}

#Preview {
    TrekListCell(treks: Trek.examples)
}
