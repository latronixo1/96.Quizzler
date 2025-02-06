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
    
    
    //таймер для смены цвета фона кнопки на исходный
    private var timer = Timer()

    //нажание кнопки
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
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
        
        //если пользователь ответил верно, то делаем кнопку зеленой, а если нет - то красной
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        
        quizBrain.nextQuestion()
        
        //ставим таймер на 0.3 секунды, чтобы вернуть цвет фона кнопки на исходный и отобразить следующий вопрос
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //отобразим новый вопрос
        updateUI()
        
    }
    
    //отображение нового вопроса
    @objc func updateUI() {
        //в текстовую метку запишем текст вопроса
        questionLabel.text = quizBrain.getQuestionText()

        //убираем цвет фона кнопок (он показал, правильно ли ответил пользователь), теперь можно убрать
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

        //изменим позицию ProgressView
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        
        //обновил количество баллов:
        scoreLabel.text = "Баллы: \(quizBrain.getScores())"
    }

    
}

