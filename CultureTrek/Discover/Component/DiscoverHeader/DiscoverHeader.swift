//
//  DiscoverHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct DiscoverHeader: View {
    
    let user : User
    
    var body: some View {
        
        HStack{
            
            UISectionTitleFontStyle(content: "Découvrir".uppercased(), size: 40, weight: .black, width: .condensed, foreground: Styles.titleForeground)
                .frame(height: Styles.buttonHeight)
            
            Spacer()
            
            ProfileButton(currentUser: user)
            
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
    DiscoverHeader(user: User.example)
}
