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
            
            UITitleFontStyle(content: "Découvrir".uppercased(), size: Styles.titleFontSize, weight: .black, width: .condensed, foreground: Styles.titleForeground)
            
            Spacer()
            
            ProfileButton(currentUser: user)
            
        }
        .padding(.horizontal, Styles.titleHorizontalPadding)
    }
}

fileprivate struct Styles {
    
    static let titleForeground = AppColor.Label.primary
    
    static let titleHorizontalPadding = AppToken.Primitive.padding4
    
    static let titleFontSize = CGFloat(40)
    
}

#Preview {
    DiscoverHeader(user: User.example)
}
