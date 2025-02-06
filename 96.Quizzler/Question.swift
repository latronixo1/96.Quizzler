//
//  Question.swift
//  96.Quizzler
//
//  Created by Валентин Картошкин on 05.02.2025.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
