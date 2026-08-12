//
//  QuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import SwiftUI
import PopupView

struct QuizScene: View {
    @State private var vm = QuizViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    TitledCard(title: "Question \(vm.currentQuestion.order)", content: vm.currentQuestion.question, kind: .secondary)

                    if vm.currentAnswer == nil {
                        Spacer()

                        VStack(spacing: 12) {
                            ForEach(vm.currentQuestion.answers, id: \.self) { answer in
                                AnswerButton(selectedAnswer: $vm.selectedAnswer, answer: answer)
                            }
                        }
                    } else {
                        if let selected = vm.currentAnswer {
                            VStack(spacing: 24) {
                                if let correct = vm.correctAnswer {
                                    CorrectAnswerCard(answer: correct)
                                }
                                
                                if selected.isGood {
                                    if let fact = vm.currentQuestion.goodAnswerFact {
                                        TitledCard(title: "À RETENIR", content: fact, kind: .info)
                                    }
                                } else {
                                    if let explanation = vm.currentQuestion.badAnswerExplanation {
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
            .popup(isPresented: $vm.isGoodPopupPresented) {
                GoodActionPopupView(title: "BONNE RÉPONSE !", obtainedXPPoints: 10)
                    .padding(32)
            } customize: {
                $0
                    .autohideIn(4)
                    .closeOnTap(true)
                    .closeOnTapOutside(false)
                    .backgroundColor(Color.black.opacity(0.32))
            }
            .popup(isPresented: $vm.isBadPopupPresented) {
                BadActionPopupView(title: "MAUVAISE RÉPONSE", content: "La bonne réponse était: \(vm.correctAnswer?.text ?? "")")
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
                vm.previousQuestion()
            } label: {
                Image(systemName: "arrow.left")
            }
            .buttonStyle(.neubrutIcon(kind: .primary))
            .disabled(vm.currentIndex == 0)
            
            LabeledProgressBar(current: UInt(vm.currentIndex + 1), total: UInt(vm.questions.count))
                .animation(.bouncy, value: vm.currentIndex + 1)
            
            let isAnswered = vm.currentAnswer != nil
            
            Button() {
                if isAnswered {
                    vm.nextQuestion()
                } else {
                    vm.validateAnswer()
                }
            } label: {
                Image(systemName: isAnswered ? "arrow.right" : "checkmark")
            }
            .buttonStyle(.neubrutIcon(kind: isAnswered ? .primary : .success))
            .disabled(!isAnswered && vm.selectedAnswer == nil)
        }
    }
}

#Preview() {
    QuizScene()
}

