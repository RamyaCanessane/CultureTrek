//
//  QuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import SwiftUI
import PopupView

struct QuizScene: View {
    let questions: [QuizQuestion]
    @State private var currentIndex: Int
    @State private var selectedAnswer: QuizQuestion.Answer? = nil
    @State private var isAnswerSubmitted: Bool = false
    @State private var isGoodPopupPresented: Bool = false
    @State private var isBadPopupPresented: Bool = false
    
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
                VStack(spacing: 24) {
                    TitledCard(title: "Question \(currentIndex + 1)", content: currentQuestion.question, kind: .secondary)
                    
                    if !isAnswerSubmitted {
                        Spacer()
                        
                        VStack(spacing: 12) {
                            ForEach(currentQuestion.answers, id: \.self) { answer in
                                AnswerButton(selectedAnswer: $selectedAnswer, answer: answer)
                            }
                        }
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
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 32)
            }
            .background(AppColor.Page.background)
            .scrollBounceBehavior(.basedOnSize)
            .sceneHeader("Quiz", onDismiss: {})
            .sceneFooter {
                bottomBar
            }
            .popup(isPresented: $isGoodPopupPresented) {
                GoodActionPopupView(title: "BONNE RÉPONSE !", obtainedXPPoints: 10)
                    .padding(32)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(true)
                    .closeOnTapOutside(false)
                    .backgroundColor(Color.black.opacity(0.32))
            }
            .popup(isPresented: $isBadPopupPresented) {
                BadActionPopupView(title: "MAUVAISE RÉPONSE", content: "La bonne réponse était: \(correctAnswer?.text ?? "")")
                    .padding(32)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(true)
                    .closeOnTapOutside(false)
                    .backgroundColor(Color.black.opacity(0.32))
            }
        }
    }
    private var bottomBar: some View {
        HStack(spacing: 16) {
            Button() {
                if currentIndex > 0 {
                    currentIndex -= 1
                }
            } label: {
                Image(systemName: "arrow.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            .disabled(currentIndex == 0)
            
            LabeledProgressBar(current: UInt(currentIndex + 1), total: UInt(questions.count))
                .animation(.bouncy, value: currentIndex + 1)
            
            Button() {
                if !isAnswerSubmitted {
                    validateAnswer()
                } else {
                    nextQuestion()
                }
            } label: {
                Image(systemName: isAnswerSubmitted ? "arrow.right" : "checkmark")
            }
            .buttonStyle(.neubrutIcon(kind: isAnswerSubmitted ? .primary : .success))
            .disabled(selectedAnswer == nil)
        }
    }
    
    private func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedAnswer = nil
            isAnswerSubmitted = false
        } else {
            print("Quiz terminé")
        }
    }
    
    private func validateAnswer() {
        if selectedAnswer != nil {
            isAnswerSubmitted = true
            
            guard let selected = selectedAnswer else {
                return
            }
            
            if selected.isGood {
                isGoodPopupPresented = true
            } else {
                isBadPopupPresented = true
            }
        }
    }
}

#Preview() {
    QuizScene(currentIndex: 0)
}

