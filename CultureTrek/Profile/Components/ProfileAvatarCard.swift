//
//  ProfileAvatarCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI

struct ProfileAvatarCard: View {
    let initials: String
    
    var body: some View {
        Text(initials)
            .font(.spaceGrotesk(size: 100, weight: .bold))
            .textCase(.uppercase)
            .minimumScaleFactor(0.2)
            .foregroundStyle(AppColor.Label.primary)
            .padding(.horizontal, 8)
            .frame(width: 130, height: 130)
            .background(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .fill(AppColor.accentPrimary)
                    .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                
            )
    }
}

#Preview {
    ProfileAvatarCard(initials: "zm")
}
