//
//  Quiz.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 30/07/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import Foundation

struct Quiz {
    var items: [Item]
    
    struct Item {
        let answers: [Answer]
        let badAnswerExplanation: String?
        let goodAnswerFact: String?
        let question: String
        let result: AnswerResult
        
        enum AnswerResult {
            case good
            case bad
            case undefined
        }
        
        enum Answer {
            case good(String)
            case bad(String)
        }
    }
}
