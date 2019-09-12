//
//  ViewController.swift
//  Bullseye
//
//  Created by Arun Sasidharan on 10/09/19.
//  Copyright © 2019 Arun. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var round = 0
    var totalScore = 0
    var currentPoints = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    @IBAction func startNewGame() {
        round = 0
        totalScore = 0
        scoreLabel.text = "0"
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue: Float = slider.value.rounded()
        currentValue = Int(roundedValue)
    }

    @IBAction func hitMeClicked() {
        updateScore()
        showAlert()
    }
    
    private func updateScore() {
        var points = 100 - abs(currentValue - targetValue)
        if points == 100 {
            points += 100
        } else if points == 99 {
            points += 50
        }
        
        currentPoints = points
        totalScore += currentPoints
        scoreLabel.text = String(totalScore)
    }
    
    private func showAlert() {
        let message = getMessage()
        let title = getTitle()
        let alert = UIAlertController(title: "\(title)", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func getTitle() -> String {
        var title : String
        if currentPoints == 200 {
            title = "Perfect!"
        } else if currentPoints == 149 {
            title = "You almost had it!"
        } else if currentPoints > 90 {
            title = "Pretty good!"
        } else if currentPoints > 80 {
            title = "Good!"
        }else {
            title = "Not Even Close!"
        }
        
        return title
    }
    
    private func getMessage() -> String {
        return "You scored \(currentPoints) points"
    }
    
    private func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        updateViews()
    }
    
    private func updateViews() {
        slider.value = Float(currentValue)
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
    }
}

