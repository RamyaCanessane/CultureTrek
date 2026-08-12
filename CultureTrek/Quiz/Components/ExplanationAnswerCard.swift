//
//  ExplanationAnswerCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 11/08/2026.
//

import SwiftUI

struct ExplanationAnswerCard: View {
//    let explanation = QuizQuestion.examples.badAnswerExplanation
    let explanation: String
    var body: some View {
        Text(explanation)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.spaceGrotesk(size: 17, weight: .regular))
            .padding(AppToken.Primitive.padding4)
            .background(AppColor.warning.opacity(0.47))
            .cornerRadius(AppToken.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
            )
    }
}

#Preview {
    ExplanationAnswerCard(explanation: "La Fête nationale française commémore le 14 juillet 1789 (prise de la Bastille).")
        .padding(16)
}
