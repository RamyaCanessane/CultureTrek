//
//  DiscoverHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct DiscoverHeader: View {
    
    let userFirstname : String
    let userLastname : String
    
    var body: some View {
        
        HStack{
            
            UISectionTitleFontStyle(content: "Découvrir".uppercased(), size: 40, weight: .black, width: .condensed, foreground: Styles.titleForeground)
                .frame(height: Styles.buttonHeight)
            
            Spacer()
            
            ProfileButton(firstname: userFirstname, lastname: userLastname)
            
        }
        .padding(.horizontal, Styles.titleHorizontalPadding)
    }
}

fileprivate struct Styles {
    
    static let titleForeground = AppColor.Label.primary
    
    static let titleHorizontalPadding = AppToken.Primitive.padding4
    static let buttonHeight = AppToken.buttonHeight
    
}

#Preview {
    DiscoverHeader(userFirstname: User.example.firstName, userLastname: User.example.lastName)
}
