//
//  ProfileCurrentXPPoints.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 13/08/2026.
//

import SwiftUI

struct ProfileCurrentXPPoints: View {
    let currentPoints: UInt
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(alignment: .center, spacing: 8) {
                AppImage.xpPointsIcon
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("\(currentPoints) points")
                    .font(.spaceGrotesk(size: 20, weight: .bold))
            }
        }
    }
}

#Preview {
    ProfileCurrentXPPoints(currentPoints: 1025)
        .padding(16)
}
