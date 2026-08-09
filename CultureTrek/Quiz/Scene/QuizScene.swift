//
//  QuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import SwiftUI

struct QuizScene: View {
    let questions: [QuizQuestion] = QuizQuestion.examples
    var currentIndex: Int = 0
    @State private var selectedAnswer: QuizQuestion.Answer? = nil
    
    init(questions: [QuizQuestion], selectedAnswerIndex: Int?) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 40, weight: .black, width: .condensed)]
    }
    
    private var currentQuestion: QuizQuestion {
        questions[currentIndex]
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TitledCard(title: "Question \(currentIndex + 1)", content: currentQuestion.question, kind: .secondary)
                    .padding(16)
                    .padding(.top, 32)
                
                VStack(spacing: 12) {
                    ForEach(currentQuestion.answers, id: \.self) { answer in
                        AnswerButton(selectedAnswer: $selectedAnswer, answer: answer)
                    }
                }
                .padding(16)
            }
            .background(AppColor.background)
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("QUIZ")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.neubrutIcon(kind: .destructive))
                    .offset(y: 50)
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
        .overlay(alignment: .bottom) {
            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                }
                .buttonStyle(.neubrutIcon(kind: .primary))
                
                LabeledProgressBar(current: 1, total: 10)
                
                Button(action: {}) {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.neubrutIcon(kind: .success))
            }
            .padding(16)
        }
    }
}

#Preview {
    QuizScene(questions: [QuizQuestion(
        answers: [
            .bad("Le muguet"),
            .good("La fève"),
            .bad("Le laurier"),
            .bad("La cotriade")
        ],
        badAnswerExplanation: "La tradition veut que l'on cache une fève dans la galette des Rois.",
        goodAnswerFact: "Celui qui trouve la fève devient le roi ou la reine de la journée !",
        order: 1,
        question: "Quel objet cache-t-on traditionnellement dans la galette des Rois à l'Épiphanie ?",
        result: .undefined
    )], selectedAnswerIndex: nil
    )
}
