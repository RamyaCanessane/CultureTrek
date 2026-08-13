//
//  QuizQuestion.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

struct QuizQuestion: Identifiable {
    let answers: [Answer]
    let badAnswerExplanation: String?
    let goodAnswerFact: String?
    var id = UUID()
    let order: UInt
    let question: String
    let result: AnswerResult
    
    var goodAnswer: String? {
        answers.first(where: {$0.isGood})?.text
    }
    
    enum AnswerResult {
        case good
        case bad
        case undefined
    }
    
    enum Answer: Hashable {
        case good(String)
        case bad(String)
    }
}

extension QuizQuestion {
    static let examples: [QuizQuestion] = [
        QuizQuestion(
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
        ),
        QuizQuestion(
            answers: [
                .good("Du muguet"),
                .bad("Des roses rouges"),
                .bad("Des lavandes"),
                .bad("Des marguerites")
            ],
            badAnswerExplanation: "La tradition du 1er mai en France est d'offrir du muguet comme porte-bonheur.",
            goodAnswerFact: "Cette tradition remonte à Charles IX qui en offrit aux dames de la cour en 1561.",
            order: 2,
            question: "Quelle fleur offre-t-on traditionnellement le 1er mai en signe de porte-bonheur ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("La Chandeleur"),
                .bad("Mardi Gras"),
                .good("La Fête de la musique"),
                .bad("La Saint-Jean")
            ],
            badAnswerExplanation: "Créée par Jack Lang en 1982, la Fête de la musique a lieu le 21 juin.",
            goodAnswerFact: "Elle coïncide généralement avec le jour du solstice d'été !",
            order: 3,
            question: "Quelle fête a été créée en France en 1982 et se déroule le jour du solstice d'été ?",
            result: .undefined
        ),
        QuizQuestion(
            answers: [
                .bad("Le camembert"),
                .bad("Le chausson aux pommes"),
                .good("La baguette"),
                .bad("Le croissant")
            ],
            badAnswerExplanation: "C'est « l'artisanat d'art et la culture de la baguette de pain » qui a été inscrit en 2022.",
            goodAnswerFact: "Chaque jour, environ 12 millions de Français poussent la porte d'une boulangerie.",
            order: 4,
            question: "Quel symbole culinaire français a été inscrit au patrimoine immatériel de l'UNESCO en 2022 ?",
            result: .undefined
        )
    ]
}

extension QuizQuestion.Answer {
    var text: String {
        switch self {
        case .good(let text):
            return text
        
        case .bad(let text):
            return text
        }
    }
    
    var isGood: Bool {
        if case.good(let string) = self {
            return true
        } else {
            return false
        }
    }
}
