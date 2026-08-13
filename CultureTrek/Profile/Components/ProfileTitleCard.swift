//
//  ProfileTitleCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI

struct ProfileTitleCard: View {
    let title: String = "MA LOCALISATION"
    var body: some View {
        Text(title)
            .fontWeight(.heavy)
            .fontWidth(.condensed)
            .font(.system(size: 20))
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .fill(AppColor.accentSecondary)
                    .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
            )
    }
}

#Preview {
    ProfileTitleCard()
}
