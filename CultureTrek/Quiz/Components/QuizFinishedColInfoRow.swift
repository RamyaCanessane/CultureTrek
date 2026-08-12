//
//  QuizFinishedColInfoRow.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct QuizFinishedColInfoRow: View {
    let result: UInt
    let numberOfQuestion: UInt
    let xpPoints: UInt
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            QuizResultColInfo(
                result: result,
                numberOfQuestion: numberOfQuestion
            )
            PointsColInfo(
                label: "Points",
                points: xpPoints
            )
            
            RankingColInfo(
                label: "Classement",
                rank: (
                    current: 81,
                    total: 267
                )
            )

        }
    }
}

#Preview {
    QuizFinishedColInfoRow(result: 5, numberOfQuestion: 12, xpPoints: 10)
}
