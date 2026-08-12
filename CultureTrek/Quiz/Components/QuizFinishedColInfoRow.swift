//
//  QuizFinishedColInfoRow.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct QuizFinishedColInfoRow: View {
    var body: some View {
        HStack(spacing: 20) {
            ResultColInfo(result: 6, numberOfQuestion: 10)
            PointsColInfo(label: "Points", points: 30)
            RankingColInfo(label: "Classement", rank: (current: 81, total: 267))
        }
    }
}

#Preview {
    QuizFinishedColInfoRow()
}
