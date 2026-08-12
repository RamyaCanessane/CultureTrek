//
//  QuizSolutionScene.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct QuizSolutionScene: View {
    @State private var vm = QuizViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.questions) { question in
                    let correctAnswer = vm.correctAnswer
                    let explanation = vm.currentQuestion.badAnswerExplanation
                    
                    SolutionRow(question: "En quelle année la Révolution française a-t-elle commencé avec la prise de la Bastille ?", answer: "1789", explanation: "La Fête nationale française commémore le 14 juillet 1789 (prise de la Bastille).", order: 1)
                    
                    //                SolutionRow(question: question.question, answer: correctAnswer ?? "", explanation: explanation ?? "", order: question.order)
                }
            }
        }
        .padding(16)
        .background(AppColor.Page.background)

    }
}

#Preview {
    QuizSolutionScene()
}
