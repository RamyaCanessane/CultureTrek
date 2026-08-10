//
//  TrekListHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListHeader: View {
    
    let icon : Image?
    let title : String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: Styles.headerSpacing){
            
            TrekListBackButton()
            
            TrekListLabel(icon: icon, title: title)
        }
        .padding(.horizontal, Styles.headerHorizontalPadding)
        
    }
}

fileprivate struct Styles {
    
    static let headerHorizontalPadding = AppToken.Primitive.padding4
    
    static let headerSpacing = AppToken.Primitive.spacing6
    
}

#Preview {
    TrekListHeader(icon: AppImage.Icon.trekLiked.image, title: "Tes favoris")
}
