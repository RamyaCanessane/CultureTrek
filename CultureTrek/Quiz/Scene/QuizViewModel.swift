//
//  QuizViewModel.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import Foundation

@Observable
class QuizViewModel {
    let questions: [QuizQuestion] = QuizQuestion.examples
    var currentIndex: Int = 0
    var selectedAnswer: QuizQuestion.Answer? = nil
    var isGoodPopupPresented: Bool = false
    var isBadPopupPresented: Bool = false
    var answers: [QuizQuestion.Answer?] = Array(repeating: nil, count: QuizQuestion.examples.count)
    
    var currentQuestion: QuizQuestion {
        questions[currentIndex]
    }
    
    var correctAnswer: QuizQuestion.Answer? {
        for answer in currentQuestion.answers {
            if answer.isGood {
                return answer
            }
        }
        return nil
    }
    
    var currentAnswer: QuizQuestion.Answer? {
        answers[currentIndex]
    }
    
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedAnswer = nil
        } else {
            print("Quiz terminé")
        }
    }
    
    func previousQuestion() {
        if currentIndex > 0 {
            currentIndex -= 1
            selectedAnswer = nil
        }
    }
    
    func validateAnswer() {
        if let selected = selectedAnswer {
            answers[currentIndex] = selected
                        
            if selected.isGood {
                isGoodPopupPresented = true
            } else {
                isBadPopupPresented = true
            }
        }
    }
}
