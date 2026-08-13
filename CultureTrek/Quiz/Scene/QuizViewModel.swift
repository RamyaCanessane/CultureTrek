//
//  QuizViewModel.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import Foundation

@Observable
class QuizViewModel {
    let questions: [QuizQuestion]
    var currentIndex: Int = 0
    var selectedAnswer: QuizQuestion.Answer? = nil
    var isGoodPopupPresented: Bool = false
    var isBadPopupPresented: Bool = false
    var answers: [QuizQuestion.Answer?]
    var isFinishedQuizPresented: Bool = false
    var goodQuestionTexts: Set<String> = []
    
    let pointsForGoodAnswer: UInt = 30 // TODO: choisir le nombre de points obtenus pour chaque question

    init(questions: [QuizQuestion]) {
        self.questions = questions
        self.answers = Array(repeating: nil, count: questions.count)
    }
    
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
    
    var isLastQuestion: Bool {
        currentIndex == questions.count - 1
    }
    
    var customResultMessage: String {
        switch getPercentScore() {
        case 100:
            return "Parfait ! Un sans-faute impressionnant !"
        case 75..<100:
            return "Bravo ! Très beau score !"
        case 50..<75:
            return "Pas mal ! Tu as assimilé l'essentiel"
        default:
            return "Prends le temps de consulter les réponses aux questions avec les explications"
        }
    }
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedAnswer = nil
        } else {
            isFinishedQuizPresented = true
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
                goodQuestionTexts.insert(selected.text)
                isGoodPopupPresented = true
            } else {
                isBadPopupPresented = true
            }
        }
    }
    
    func getFinishedResult() -> UInt {
        UInt(goodQuestionTexts.count)
    }
    
    func getFinishedNumberOfQuestions() -> UInt {
        UInt(questions.count)
    }
    
    func getFinishedPoints() -> UInt {
        UInt(goodQuestionTexts.count) * pointsForGoodAnswer
    }
    
    func getPercentScore() -> Double {
        return (Double(goodQuestionTexts.count) / Double(questions.count)) * 100
    }
}

