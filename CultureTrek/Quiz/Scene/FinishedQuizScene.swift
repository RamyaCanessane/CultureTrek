//
//  FinishedQuizScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 11/08/2026.
//

import SwiftUI

struct FinishedQuizScene: View {
    let vm: QuizViewModel
    
    @State private var isQuizSolutionPresented: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var progressBarData: LevelCalculator.ProgressBarData?
    
    private let user: User
    
    init(vm: QuizViewModel, user: User) {
        self.vm = vm
        self.user = user

        let points = vm.getFinishedPoints()
        
        print("QuizFinished, currentPoints = \(user.currentXPPoints), earned: \(points)")
        
        self._progressBarData = State(initialValue: LevelCalculator.getProgressBarData(currentXPPoints: user.currentXPPoints,
                                                                                       newXPPoints: points))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(AppColor.border, AppColor.success)
                    .frame(width: 196, height: 196)
                    .overlay {
                        Image(systemName: "seal")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 200, height: 200)
                            .fontWeight(.thin)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                
                VStack(alignment: .leading, spacing: 4) {
                    UITitle(
                        content: "Résulats du quiz",
                        size: 24,
                        weight: .black,
                        width: .condensed,
                        foreground: AppColor.Label.primary
                    )
                    Text("Bien joué ! Tu maîtrises bien le sujet, encore un petit effort pour le sans-faute !")
                        .font(.spaceGrotesk(size: 15, weight: .medium))
                        .foregroundStyle(AppColor.Label.primary)
                }
                
                QuizFinishedColInfoRow(
                    result: vm.getFinishedResult(),
                    numberOfQuestion: vm.getFinishedNumberOfQuestions(),
                    xpPoints: vm.getFinishedPoints()
                )
                
                if let data = progressBarData {
                    LevelWithProgressBar(
                        newPoints: data.newPoints,
                        currentPoints: data.currentPoints,
                        totalPoints: data.totalPoints,
                        currentLevel: data.currentLevel.name,
                        nextLevel: data.nextLevel?.name ?? "--"
                    )
                }
                
                Button("Réponses aux questions") {
                    isQuizSolutionPresented = true
                }
                .buttonStyle(.neubrutProminent(kind: .primary, icon: nil, isFullWidth: true))
            }
            .padding(16)
        }
        .background(AppColor.Page.background)
        .scrollBounceBehavior(.basedOnSize)
        .sceneFooter {
            Button("Fermer le quiz") {
                dismiss()
                
                user.addXPPoints(vm.getFinishedPoints())
                
                print(user)
            }
            .buttonStyle(.neubrutProminent(kind: .neutral, icon: nil, isFullWidth: true))
        }
        .fullScreenCover(isPresented: $isQuizSolutionPresented) {
            QuizSolutionScene(questions: vm.questions)
        }
    }
}

#Preview {
    FinishedQuizScene(vm: QuizViewModel(questions: QuizQuestion.examples),
                      user: .example)
}
