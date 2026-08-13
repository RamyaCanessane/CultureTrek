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
            .font(.spaceGrotesk(size: 60, weight: .bold))
            .foregroundStyle(AppColor.Label.primary)
            .frame(height: 115)
            .frame(minWidth: 100)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .fill(AppColor.accentPrimary)
                    .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                
            )
    }
}

#Preview {
    ProfileAvatarCard(initials: "RC")
}
