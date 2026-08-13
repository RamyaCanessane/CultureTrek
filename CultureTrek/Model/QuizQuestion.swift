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
        ),
//        QuizQuestion(
//            answers: [
//                .bad("Des gaufres"),
//                .good("Des crêpes"),
//                .bad("Des beignets"),
//                .bad("Des macarons")
//            ],
//            badAnswerExplanation: "À la Chandeleur (2 février), la tradition veut que l'on prépare et mange des crêpes.",
//            goodAnswerFact: "La tradition dit qu'il faut faire sauter la crêpe de la main droite avec une pièce dans la main gauche.",
//            order: 5,
//            question: "Que cuisine-t-on traditionnellement en France lors de la fête de la Chandeleur ?",
//            result: .undefined
//        ),
//        QuizQuestion(
//            answers: [
//                .bad("Nice"),
//                .good("Menton"),
//                .bad("Cannes"),
//                .bad("Grasse")
//            ],
//            badAnswerExplanation: "La célèbre Fête du Citron a lieu chaque année à Menton, sur la Côte d'Azur.",
//            goodAnswerFact: "Des sculptures géantes faites exclusivement d'agrumes y sont exposées.",
//            order: 6,
//            question: "Dans quelle ville de la Côte d'Azur célèbre-t-on chaque année la « Fête du Citron » ?",
//            result: .undefined
//        ),
//        QuizQuestion(
//            answers: [
//                .bad("Le 1er mai"),
//                .bad("Le 11 novembre"),
//                .good("Le 14 juillet"),
//                .bad("Le 15 août")
//            ],
//            badAnswerExplanation: "La Fête nationale française commémore le 14 juillet 1789 (prise de la Bastille).",
//            goodAnswerFact: "Le traditionnel défilé militaire sur les Champs-Élysées existe depuis 1880.",
//            order: 7,
//            question: "À quelle date célèbre-t-on la Fête nationale en France ?",
//            result: .undefined
//        ),
//        QuizQuestion(
//            answers: [
//                .good("Le Beaujolais nouveau"),
//                .bad("Le Bordeaux supérieur"),
//                .bad("Le Champagne brut"),
//                .bad("Le Rosé de Provence")
//            ],
//            badAnswerExplanation: "C'est le Beaujolais nouveau qui est débouché le 3e jeudi de novembre.",
//            goodAnswerFact: "L'événement donne lieu à la célèbre expression : « Le Beaujolais nouveau est arrivé ! »",
//            order: 8,
//            question: "Quel vin célèbre fête son arrivée le troisième jeudi de novembre ?",
//            result: .undefined
//        ),
//        QuizQuestion(
//            answers: [
//                .bad("Marseille"),
//                .bad("Bordeaux"),
//                .good("Lyon"),
//                .bad("Strasbourg")
//            ],
//            badAnswerExplanation: "La Fête des Lumières est une tradition emblématique de la ville de Lyon.",
//            goodAnswerFact: "Les Lyonnais posent des lumignons à leurs fenêtres chaque 8 décembre en l'honneur de la Vierge Marie.",
//            order: 9,
//            question: "Quelle grande ville française célèbre la « Fête des Lumières » début décembre ?",
//            result: .undefined
//        ),
//        QuizQuestion(
//            answers: [
//                .bad("La galette des Rois"),
//                .bad("La brioche vendéenne"),
//                .good("La bûche de Noël"),
//                .bad("Le Paris-Brest")
//            ],
//            badAnswerExplanation: "La bûche est le dessert traditionnel du repas de Noël.",
//            goodAnswerFact: "À l'origine, il s'agissait d'une vraie bûche de bois qu'on brûlait dans l'âtre pour porter bonheur.",
//            order: 10,
//            question: "Quel dessert incontournable clôture traditionnellement le repas du réveillon de Noël ?",
//            result: .undefined
//        )
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
