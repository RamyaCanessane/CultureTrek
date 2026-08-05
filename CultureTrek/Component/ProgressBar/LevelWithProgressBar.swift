//
//  LevelWithProgressBar.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 05/08/2026.
//

import SwiftUI

struct LevelWithProgressBar: View {
    private let newPoints: UInt
    private let currentPoints: UInt
    private let totalPoints: UInt
    private let progression: Double
    private let progressionNew: Double
    private let currentLevel: String
    private let nextLevel: String
        
    init(newPoints: UInt, currentPoints: UInt, totalPoints: UInt, currentLevel: String, nextLevel: String) {
        self.currentPoints = currentPoints
        self.newPoints = newPoints
        self.progressionNew = Double(newPoints) / Double(totalPoints)
        self.totalPoints = totalPoints
        if currentPoints <= totalPoints && totalPoints > 0 {
            self.progression = Double(currentPoints) / Double(totalPoints)
        } else {
            self.progression = 0
        }
        self.currentLevel = currentLevel
        self.nextLevel = nextLevel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(currentLevel)
                .font(.spaceGrotesk(size: 20, weight: .medium))
            
            progressBar
            
            HStack {
                summaryText
                .font(.spaceGrotesk(size: 17,
                                    weight: .medium))
                Image(.xpPointsIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
    }
    
    private var progressBar: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                .fill(AppColor.accentNeutral)
                .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
                .frame(maxWidth: .infinity)
                .frame(height: 24)
                .overlay(alignment: .leading) {
                    HStack(spacing: -AppToken.borderWidth) {
                        Rectangle()
                        .fill(AppColor.accentSecondary)
                        .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
                        .frame(width: geo.size.width * progression - 4 + AppToken.borderWidth / 2.0, height: 16)
                        
                        UnevenRoundedRectangle(
                            topLeadingRadius: AppToken.Primitive.radiusNone,
                            bottomLeadingRadius: AppToken.Primitive.radiusNone,
                            bottomTrailingRadius: currentPoints == totalPoints ? AppToken.Primitive.radiusNone : AppToken.cornerRadius,
                            topTrailingRadius: currentPoints == totalPoints ? AppToken.Primitive.radiusNone : AppToken.cornerRadius
                        )
                        .fill(AppColor.xpPoints)
                        .strokeBorder(AppColor.border, lineWidth: AppToken.borderWidth)
                        .frame(width: geo.size.width * progressionNew - 4 + AppToken.borderWidth / 2.0, height: 16)
                    }
                    .offset(x: 4)
                }
                
        }
        .frame(height: 24)
    }
    
    private var summaryText: Text {
        Text(
            """
            \(Text("Prochain rang: ")) \(Text("\(nextLevel)").fontWeight(.bold)) \(Text("dans ")) \(Text("\(remainingPoints)").fontWeight(.bold))
            """
        )
    }
    
    private var remainingPoints: UInt {
        totalPoints - (currentPoints + newPoints)
    }
}

#Preview {
    LevelWithProgressBar(newPoints: 4,
                      currentPoints: 10,
                      totalPoints: 20,
                      currentLevel: "Fer",
                      nextLevel: "Bronze")
        .padding()
}
