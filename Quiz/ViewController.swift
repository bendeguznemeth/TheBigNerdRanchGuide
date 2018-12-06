//
//  ViewController.swift
//  Quiz
//
//  Created by Németh Bendegúz on 2018. 11. 29..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    private let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    private let answers:[String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    private var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        questionLabel.alpha = 0
    }

    @IBAction func onNextQuestionClick(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.alpha = 0
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func onShowAnswerClick(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    private func animateLabelTransitions() {
        
//        let animationClosure = { () -> Void in
//            self.questionLabel.alpha = 1
//        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.questionLabel.alpha = 1
        })
    }
    
}

