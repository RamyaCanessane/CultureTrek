//
//  ProfileButton.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct ProfileButton: View {
    
    let currentUser : User
    
    var body: some View {
        
        Button {
            //Affiche la vue de profil
        } label: {
            RoundedRectangle(cornerRadius: Styles.buttonCornerRadius)
                .fill(Styles.buttonBackground)
                .strokeBorder(Styles.buttonBorderColor, lineWidth: Styles.buttonBorderWidth)
                .overlay {
                    Text(currentUser.getNameInitials())
                        .font(.spaceGrotesk(size: 24, weight: .bold))
                        .foregroundStyle(Styles.buttonForeground)
                }
                .frame(width: Styles.buttonSize, height: Styles.buttonSize)
        }

        
    }
}

fileprivate struct Styles {
    
    static let buttonForeground = AppColor.Label.primary
    static let buttonBackground = AppColor.accentPrimary
    static let buttonBorderColor = AppColor.border

    static let buttonSize = AppToken.buttonHeight
    static let buttonCornerRadius = AppToken.cornerRadius
    static let buttonBorderWidth = AppToken.borderWidth 
}

#Preview {
    ProfileButton(currentUser: User.example)
}
