//
//  ViewController.swift
//  96.Quizzler
//
//  Created by Валентин Картошкин on 05.02.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    //массив с вопросами
    private let quiz = [
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
    
    //таймер для смены цвета фона кнопки на исходный
    private var timer = Timer()
    
    //номер вопроса
    var questionNumber = 0
    
    //нажание кнопки
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //инвалидируем (сбрасываем, если запущен) таймер - для исключения дублирования (запуска нескольких таймеров одновременно)
        timer.invalidate()
        
        //ответ пользователя
        let userAnswer: String
 
        //безопасно извлекаем текст кнопки
        if let buttonPressed = sender.titleLabel?.text {
            userAnswer = buttonPressed
        } else {
            print("Нажата неверная кнопка")
            return
        }
        
        //правильный ответ
        let actualQuestion = self.quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
         
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //ставим таймер на 0.2 секунды, чтобы вернуть цвет фона кнопки на исходный и отобразить следующий вопрос
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        
        //меняем номер вопроса
        questionNumber = questionNumber == quiz.count - 1 ? 0 : questionNumber + 1
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //отобразим новый вопрос
        updateUI()
        
    }
    
    //отображение нового вопроса
    @objc func updateUI() {
        //в текстовую метку запишем текст вопроса
        questionLabel.text = quiz[questionNumber].text

        //убираем цвет фона кнопок (он показал, правильно ли ответил пользователь), теперь можно убрать
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

        //изменим позицию ProgressView
        progressView.setProgress(Float(questionNumber + 1) / Float(quiz.count), animated: true)
    }

    
}

