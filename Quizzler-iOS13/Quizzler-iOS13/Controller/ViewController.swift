//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLable: UILabel!
    
    var quizStorage = QuizStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLable.text = quizStorage.getQuestion()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let result = quizStorage.checkAnswer(userAnswer!)
        
        if result {
            sender.backgroundColor = UIColor.green
            quizStorage.updateScore()
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        updateQuestion()
        updateProgressBar()
        updateScoreBoard()
        animateButtons(sender: sender)
    }
    
    func updateQuestion(){
        quizStorage.updateQuestionNumber()
        questionLable.text = quizStorage.getQuestion()
    }
    func animateButtons(sender: UIButton){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.2) {
                sender.backgroundColor = UIColor.clear
            }
        }
    }
    func updateProgressBar(){
        progressBar.progress = quizStorage.getProgress()
    }
    func updateScoreBoard(){
        scoreLable.text = "Score \(quizStorage.getScore())"
    }
}

