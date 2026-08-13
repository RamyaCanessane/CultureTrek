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
        .padding(.bottom, Styles.bottomPading)
        .background {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        Styles.background.opacity(0.64),
                        Styles.background.opacity(1),
                        Styles.background.opacity(1)
                    ],
                                   startPoint: .bottom,
                                   endPoint: .top)
                )
                .padding(-20)
                .blur(radius: 10)
                .padding(20)
                .padding(.top, -20)
        }
        
    }
}

fileprivate struct Styles {
    
    static let headerHorizontalPadding = AppToken.Primitive.padding4
    
    static let headerSpacing = AppToken.Primitive.spacing6
    
    static let background = AppColor.Page.background
    
    static let bottomPading = AppToken.Primitive.spacing6
    
}

#Preview {
    TrekListHeader(icon: AppImage.Icon.trekLiked.image, title: "Tes favoris")
}
