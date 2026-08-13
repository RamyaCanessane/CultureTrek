//
//  ProfileCurrentXPPointsCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI

struct ProfileCurrentXPPointsCard: View {
    let currentPoints: UInt
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "star")
                    .font(.spaceGrotesk(size: 15, weight: .medium))
                
                Text("\(currentPoints)")
                    .font(.spaceGrotesk(size: 20, weight: .bold))
            }
            .foregroundStyle(AppColor.Label.primary)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .fill(AppColor.accentSecondary)
                    .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                
            )
            Text("POINTS")
                .font(.spaceGrotesk(size: 16, weight: .regular))
                .foregroundStyle(AppColor.Label.primary)
        }
    }
}

#Preview {
    ProfileCurrentXPPointsCard(currentPoints: 1025)
        .padding(16)
}
