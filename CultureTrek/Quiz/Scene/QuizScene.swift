//
//  QuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import SwiftUI

struct QuizScene: View {
    let questions: [QuizQuestion]
    var currentIndex: Int = 0
    @State private var selectedAnswer: QuizQuestion.Answer? = nil
    @State private var isAnswerSubmitted: Bool = false
    @State private var showPopup: Bool = false
    
    init(questions: [QuizQuestion] = QuizQuestion.examples, currentIndex: Int = 0) {
        self.questions = questions
        self.currentIndex = currentIndex
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 40, weight: .black, width: .condensed)]
    }
    
    private var currentQuestion: QuizQuestion {
        questions[currentIndex]
    }
    
    private var correctAnswer: QuizQuestion.Answer? {
        for answer in currentQuestion.answers {
            if answer.isGood {
                return answer
            }
        }
        return nil
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TitledCard(title: "Question \(currentIndex + 1)", content: currentQuestion.question, kind: .secondary)
                    .padding(16)
                    .padding(.top, 32)
                
                if !isAnswerSubmitted {
                    VStack(spacing: 12) {
                        ForEach(currentQuestion.answers, id: \.self) { answer in
                            AnswerButton(selectedAnswer: $selectedAnswer, answer: answer)
                        }
                    }
                    .padding(16)
                } else {
                    if let selected = selectedAnswer {
                        VStack(spacing: 24) {
                            if let correct = correctAnswer {
                                CorrectAnswerCard(answer: correct)
                            }
                            
                            if selected.isGood == true {
                                if let fact = currentQuestion.goodAnswerFact {
                                    TitledCard(title: "À RETENIR", content: fact, kind: .info)
                                }
                            } else {
                                if let explanation = currentQuestion.badAnswerExplanation {
                                    TitledCard(title: "EXPLICATION", content: explanation, kind: .warning)
                                }
                            }
                        }
                        .padding(16)
                    }
                }
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
            .overlay(alignment: .bottom) {
                bottomBar
            }
            .overlay {
                if showPopup, let selected = selectedAnswer {
                    popUpOverlay(answer: selected)
                }
            }
        }
    }
    private var bottomBar: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            
            LabeledProgressBar(current: 1, total: 10)
            
            Button() {
                if selectedAnswer != nil {
                    isAnswerSubmitted = true
                    showPopup = true
                }
            } label: {
                Image(systemName: "checkmark")
            }
            .buttonStyle(.neubrutIcon(kind: .success))
            .disabled(selectedAnswer == nil)
        }
        .padding(16)
    }
    
    private func popUpOverlay(answer: QuizQuestion.Answer) -> some View {
        ZStack {
            Color.primitiveInverseBackground.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    showPopup = false
                }
            
            if answer.isGood {
                GoodActionPopupView(title: "BONNE RÉPONSE !", obtainedXPPoints: 10)
                    .padding(16)
            } else {
                BadActionPopupView(title: "MAUVAISE RÉPONSE", content: "La bonne réponse était: \(correctAnswer?.text ?? "")")
                    .padding(16)
            }
        }
    }
}

#Preview() {
    QuizScene(currentIndex: 0)
}

