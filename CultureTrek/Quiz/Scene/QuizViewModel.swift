//
//  QuizViewModel.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 02/08/2026.
//

import Foundation

@Observable
class QuizViewModel {
    var questions: [QuizQuestion]
    var currentIndex: Int = 0
    var isSubmitted: Bool
    var selectedAnswerIndex: Int?
    var score: Int?
    
    init(questions: [QuizQuestion], currentIndex: Int, isSubmitted: Bool, selectedAnswerIndex: Int? = nil, score: Int? = nil) {
        self.questions = questions
        self.currentIndex = currentIndex
        self.isSubmitted = isSubmitted
        self.selectedAnswerIndex = selectedAnswerIndex
        self.score = score
    }
    
    
}
