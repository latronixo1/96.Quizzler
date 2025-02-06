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
  
    var quizBrain = QuizBrain()
    
    
//    //таймер для смены цвета фона кнопки на исходный
//    private var timer = Timer()

    //нажание кнопки
    @IBAction func answerButtonPressed(_ sender: UIButton) {
//        //инвалидируем (сбрасываем, если запущен) таймер - для исключения дублирования (запуска нескольких таймеров одновременно)
//        timer.invalidate()
        
        //Проверка ответа
        //ответ пользователя
        let userAnswer: String
 
        //безопасно извлекаем текст кнопки
        if let buttonPressed = sender.titleLabel?.text {
            userAnswer = buttonPressed
        } else {
            print("Нажата неверная кнопка")
            return
        }
        
        
        sender.backgroundColor = quizBrain.checkAnswer(userAnswer)
        
        //меняем номер вопроса
        questionNumber = questionNumber == quiz.count - 1 ? 0 : questionNumber + 1

        //ставим таймер на 0.2 секунды, чтобы вернуть цвет фона кнопки на исходный и отобразить следующий вопрос
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        
        
        
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

