//
//  ViewController.swift
//  UpDownGame
//
//  Created by Jiyoon on 2017. 1. 25..
//  Copyright © 2017년 Jiyoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var modeSelection: UISegmentedControl!
    @IBOutlet weak var okButton: UIButton!
    
    var game: UpDownGame?
    var gameMode: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.delegate = self
        game = UpDownGame(max: 10)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //touch -> keyboard resign
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        answerField.resignFirstResponder()
    }
    
    func isAnswer(input: Int!) {
        let result = game?.isIt(input!)
        var alert: UIAlertController
        var defaultAction: UIAlertAction
        
        progressAction()
        
        if result == "Up" || result == "Down"  {
            alert = UIAlertController(title: result, message: "keep going!", preferredStyle: .alert)
            defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
        
        else if result == "Right" {
            alert = UIAlertController(title: "Right", message: "one more game?", preferredStyle: .alert)
            defaultAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
            gameReset()
        }
        
        else {
            alert = UIAlertController(title: "Game Over", message: "Answer is \((game?.randNum)!)", preferredStyle: .alert)
            defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            
            gameReset()
        }
    }
    
    func progressAction() {
        if gameMode == 10 {
            progressLabel.text = "\((game?.count)!) / 5"
            progressBar.progress += 0.2
        }
        else if gameMode == 50 {
            progressLabel.text = "\((game?.count)!) / 10"
            progressBar.progress += 0.1
        }
        else {
            progressLabel.text = "\((game?.count)!) / 20"
            progressBar.progress += 0.05
        }
    }
    
    func gameReset() {
        progressBar.progress = 0.0
        
        if gameMode == 10 {
            progressLabel.text = "0 / 5"
        }
        
        else if gameMode == 50 {
            progressLabel.text = "0 / 10"
        }
        
        else {
            progressLabel.text = "0 / 20"
        }
        
        game = UpDownGame(max: gameMode)
    }
    
    @IBAction func modeChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        progressBar.progress = 0.0
        
        if index == 0 {
            gameMode = 10
            progressLabel.text = "0 / 5"
        }
        else if index == 1 {
            gameMode = 50
            progressLabel.text = "0 / 10"
        }
        else {
            gameMode = 100
            progressLabel.text = "0 / 20"
        }
        
        game = UpDownGame(max: gameMode)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let num: Int? = Int(answerField.text!)
        
        self.isAnswer(input: num)
    }
}

