//
//  QuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import SwiftUI
import PopupView

struct QuizScene: View {
    @State private var vm: QuizViewModel
    
    @Environment(AppStore.self) private var appStore
    @Environment(\.dismiss) private var dismiss
    
    init(questions: [QuizQuestion]) {
        self._vm = State(initialValue: .init(questions: questions))
    }
    
    var body: some View {
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
                                    TitledCard(title: "À retenir", content: fact, kind: .info)
                                }
                            } else {
                                if let explanation = vm.currentQuestion.badAnswerExplanation {
                                    TitledCard(title: "Explication", content: explanation, kind: .warning)
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
        .sceneHeader("Quiz", onDismiss: {dismiss()})
        .sceneFooter {
            bottomBar
        }
        .fullScreenCover(isPresented: $vm.isFinishedQuizPresented, onDismiss: {
            dismiss()
        }) {
            FinishedQuizScene(vm: vm, user: appStore.user)
        }
        .popup(isPresented: $vm.isGoodPopupPresented) {
            GoodActionPopupView(title: "Bonne réponse !",
                                obtainedXPPoints: vm.pointsForGoodAnswer)
            .padding(32)
        } customize: {
            $0
                .autohideIn(4)
                .closeOnTap(false)
                .closeOnTapOutside(false)
                .backgroundColor(Color.black.opacity(0.32))
        }
        .popup(isPresented: $vm.isBadPopupPresented) {
            BadActionPopupView(title: "Mauvaise réponse",
                               content: "La bonne réponse était: \(vm.correctAnswer?.text ?? "")")
            .padding(32)
        } customize: {
            $0
                .autohideIn(4)
                .closeOnTap(false)
                .closeOnTapOutside(false)
                .backgroundColor(Color.black.opacity(0.32))
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
            
            LabeledProgressBar(
                current: UInt(
                    vm.currentIndex + 1
                ),
                total: UInt(vm.questions.count)
            )
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
            .buttonStyle(.neubrutIcon(kind: isAnswered
                                      ? (vm.isLastQuestion ? .success : .primary)
                                      : .success))
            .disabled(!isAnswered && vm.selectedAnswer == nil)
        }
    }
}

#Preview() {
    QuizScene(questions: QuizQuestion.examples)
        .environment(AppStore(user: .example))
}

