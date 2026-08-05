//
//  LabeledProgressBar.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 04/08/2026.
//

import SwiftUI

struct LabeledProgressBar: View {
    private var progression: Double
    private var current: UInt
    private var total: UInt
    
    init(current: UInt, total: UInt) {
        self.current = current
        self.total = total
        if current <= total && total > 0 {
            self.progression = Double(current) / Double(total)
        } else {
            self.progression = 0
        }
    }
    var body: some View {
        HStack(spacing: 12) {
            Text("\(current)/\(total)")
                .font(.spaceGrotesk(size: 20, weight: .bold))
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .strokeBorder(AppColor.border,
                                  lineWidth: AppToken.borderWidth)
                    .frame(height: 24)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                            .fill(AppColor.accentSecondary)
                            .strokeBorder(AppColor.border,
                                          lineWidth: AppToken.borderWidth)
                            .frame(width: geo.size.width * progression - 8, height: 16)
                            .offset(x: 4)
                    }
            }
            .frame(height: 24)
        }
    }
}

#Preview {
    LabeledProgressBar(current: 1, total: 1)
        .padding()
}

