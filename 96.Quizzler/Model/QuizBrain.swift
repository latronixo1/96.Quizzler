//
//  QuizBrain.swift
//  96.Quizzler
//
//  Created by Валентин Картошкин on 06.02.2025.
//

import Foundation

struct QuizBrain {
    //массив с вопросами
    let quiz = [
        Question(q: "Кровь слизняка зеленая", a: "Правда"),
        Question(q: "Примерно четверть костей человека находится в ступнях", a: "Правда"),
        Question(q: "Общая площадь двух человеческих легких составляет примерно 70 квадратных метров", a: "Правда"),
        Question(q: "В Западной Вирджинии, США, если вы случайно сбили животное своей машиной, вы можете забрать его домой, чтобы перекусить.", a: "Правда"),
        Question(q: "В Лондоне, Великобритания, если вам посчастливилось умереть в здании парламента, вы формально имеете право на государственные похороны, поскольку это здание считается слишком священным местом.", a: "Ложь"),
        Question(q: "В Португалии запрещено мочиться в океан.", a: "Правда"),
        Question(q: "Вы можете вести корову вниз по лестнице, но не наверх.", a: "Ложь"),
        Question(q: "Изначально Google назывался Backrub", a: "Правда"),
        Question(q: "Девичья фамилия матери Базза Олдрина была Мун", a: "Правда"),
        Question(q: "Самый громкий звук, издаваемый любым животным, составляет 188 децибел. Это животное - африканский слон", a: "Ложь"),
        Question(q: "Ни один квадратный лист сухой бумаги нельзя складывать пополам более 7 раз.", a: "Ложь"),
        Question(q: "Шоколад воздействует на сердце и нервную систему собаки; нескольких унций достаточно, чтобы убить маленькую собаку", a: "Правда")
    ]
    
    //номер вопроса
    var questionNumber = 0
    //количество баллов
    var scores = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool  {
        //проверяем, правильно ли пользователь ответил
        if userAnswer == quiz[questionNumber].answer {
            scores += 1
            return true
        } else {
            return false
        }
    }

    func getQuestionText () -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
        
    }
    
    mutating func nextQuestion() {
        //меняем номер вопроса
        if questionNumber == quiz.count - 1 {
            questionNumber = 0
            scores = 0
        } else {
            questionNumber += 1
        }
    }
    mutating func getScores() -> Int {
        return scores
    }
}
