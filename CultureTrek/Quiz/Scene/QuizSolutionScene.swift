//
//  QuizSolutionScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct QuizSolutionScene: View {
    @Environment(\.dismiss) private var dismiss
    
    private let questions: [QuizQuestion]
    
    init(questions: [QuizQuestion]) {
        self.questions = questions
    }
    
    var body: some View {
        List {
            ForEach(questions) { question in
                SolutionRow(
                    question: question.question,
                    answer: question.goodAnswer ?? "",
                    explanation: question.badAnswerExplanation ?? "",
                    order: question.order
                )
                .listRowSeparator(.hidden)
                .listRowInsets(.vertical, 8)
                .listRowBackground(AppColor.Page.background)
            }
            
        }
        .listStyle(.plain)
        .background(AppColor.Page.background)
        .sceneHeader("Réponses", onDismiss: {dismiss()})
    }
}

#Preview {
    QuizSolutionScene(questions: QuizQuestion.examples)
}
