//
//  ViewController.swift
//  WhatsTheNumber
//
//  Created by user on 2021/4/5.
//  Copyright © 2021 JerryStdudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //make a random number
    var answer = Int.random(in: 1...9999)
    var maxNumber = 9999
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!

    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            //playing game
            print(answer)
            //take input text out
            let inputText = inputTextField.text!
            print("Input text = \(inputText)")
            //clear textfield
            inputTextField.text = ""
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                //no input
                messageLabel.text = "No input! Guess a number between \(minNumber)~\(maxNumber)"
            }else{
                //got input
                if inputNumber! > maxNumber{
                    //user input too large
                    messageLabel.text = "Too large! Guess a number between \(minNumber)~\(maxNumber)"
                }else if inputNumber! < minNumber{
                    //user input too small
                    messageLabel.text = "Too small! Guess a number between \(minNumber)~\(maxNumber)"
                }else{
                    if inputNumber! == answer{
                        //bingo! right answer
                        messageLabel.text = "You are right! Press [Guess] to play again"
                        isOver = true
                    }else{
                        //wrong answer
                        if inputNumber! > answer{
                            //large than answer
                            maxNumber = inputNumber!
                        }else{
                            //small than answer
                            minNumber = inputNumber!
                        }
                        messageLabel.text = "Try again! Guess a number between \(minNumber)~\(maxNumber)"
                    }
                }
            }
        }else{
            //game is over
            maxNumber = 9999
            minNumber = 1
            messageLabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
            answer = Int.random(in: 1...9999)
            isOver = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //push the keyboard up
        inputTextField.becomeFirstResponder()
        
       
    }


}

