//
//  TitledProgressBar.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 05/08/2026.
//

import SwiftUI

struct TitledProgressBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fer")
                .font(.spaceGrotesk(size: 20, weight: .medium))
            Rectangle()
                .frame(width: 361, height: 24)
            HStack {
                Text("Prochain rang: Bronze dans 234")
                Image(.xpPointsIcon)
            }
        }
    }
}

#Preview {
    TitledProgressBar()
}
