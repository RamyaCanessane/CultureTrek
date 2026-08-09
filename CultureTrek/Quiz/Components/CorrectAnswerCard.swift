//
//  CorrectAnswerCard.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 09/08/2026.
//

import SwiftUI

struct CorrectAnswerCard: View {
    let answer: QuizQuestion.Answer
    
    var body: some View {
        Text(answer.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.spaceGrotesk(size: 17, weight: .regular))
            .padding(AppToken.Primitive.padding4)
            .background(AppColor.popupGoodAnswerBackground)
            .cornerRadius(AppToken.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
            )
    }
}

#Preview {
    CorrectAnswerCard(answer: .good("O tempora, o mores! Senatus haec intellegit, consul videt; hic tamen vivit."))
        .padding(16)
}
