//
//  AnswerButton.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 06/08/2026.
//

import SwiftUI

struct AnswerButton: View {
    @Binding var selectedAnswer: QuizQuestion.Answer?
    
    let answer: QuizQuestion.Answer
    
    private var isSelected: Bool {
        selectedAnswer == answer
    }
    
    var body: some View {
        Button {
            selectedAnswer = answer
        } label: {
            Text(answer.text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.spaceGrotesk(size: 17, weight: .regular))
                .padding(AppToken.Primitive.padding4)
                .border(AppColor.border, width: AppToken.borderWidth)
                .background(
                    RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                        .fill(isSelected ? .primitiveAccentSecondary : .primitiveAccentNeutral)
                        .shadow(color: isSelected ? .clear : AppColor.shadow,
                                radius: AppToken.Primitive.radiusNone,
                                x: isSelected ? 0 : AppToken.shadowSize,
                                y: isSelected ? 0 : AppToken.shadowSize
                               )
                )
                .offset(x: isSelected ? AppToken.shadowSize : 0,
                        y: isSelected ? AppToken.shadowSize : 0
                )
        }
        .buttonStyle(.plain)
        .animation(AppToken.buttonPressedAnimation, value: isSelected)
    }
}

#Preview {
    AnswerButton(selectedAnswer: .constant(nil), answer: .good("O tempora, o mores! Senatus haec intellegit, consul videt; hic tamen vivit."))
        .padding(16)
}
