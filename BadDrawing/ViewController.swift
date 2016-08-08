//
//  ViewController.swift
//  BadDrawing
//
//  Created by Sachin Katyal on 12/29/15.
//  Copyright © 2015 Sachin Katyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lastNumber: String!
    var answer: Int!
    var num1: Int!
    var num2: Int!
    
    @IBOutlet var answerField: UILabel!
    @IBOutlet var operatorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonTapped(theButton: UIButton) {
        
        if answerField.text == "0" {
            answerField.text = theButton.titleLabel!.text
        } else {
            answerField.text = answerField.text! + (theButton.titleLabel?.text)!
        }
        
    }
    
    @IBAction func plusTapped(theButton: UIButton) {
        if operatorLabel.text == "" {
            operatorLabel.text = "+"
            lastNumber = answerField.text
            answerField.text = "0"
            
        } else {
            lastNumber = answerField.text
            enterTapped(nil)
            operatorLabel.text = "+"
        }
    }
    
    @IBAction func minusTapped(theButton: UIButton) {
        if operatorLabel.text == "" {
            operatorLabel.text = "-"
            lastNumber = answerField.text
            answerField.text = "0"
            
        } else {
            lastNumber = answerField.text
            enterTapped(nil)
            operatorLabel.text = "-"
        }
    }
    
    @IBAction func timesTapped(theButton: UIButton) {
        if operatorLabel.text == "" {
            operatorLabel.text = "*"
            lastNumber = answerField.text
            answerField.text = "0"
            
        } else {
            lastNumber = answerField.text
            enterTapped(nil)
            operatorLabel.text = "*"
        }
    }
    
    @IBAction func divisionTapped(theButton: UIButton) {
        if operatorLabel.text == "" {
            operatorLabel.text = "/"
            lastNumber = answerField.text
            answerField.text = "0"
            
        } else {
            lastNumber = answerField.text
            enterTapped(nil)
            operatorLabel.text = "/"
        }
    }

    
    @IBAction func enterTapped(object: AnyObject?) {
        num1 = Int(lastNumber)
        num2 = Int(answerField.text!)
        
        if num1 == nil || num2 == nil {
            showError()
            return
        }
        
        answer = 0
        
        if operatorLabel.text == "-" {
            answer = num1 - num2
            
        } else if operatorLabel.text == "+" {
            answer = num1 + num2
        } else if operatorLabel.text == "*" {
            answer = num1 * num2
            print(answer)
        } else if operatorLabel.text == "/" {
            if num2 > 0 || num2 < 0 {
                answer = num1 / num2
            } else {
                answerField.text = "Error"
                return
            }
        } else {
            showError()
            return
        }
        answerField.text = "\(answer)"
    }
    
    
    @IBAction func clearTapped(object: AnyObject) {
        answerField.text = "0"
        lastNumber = ""
        operatorLabel.text = ""
    
    }
    
    func showError() {
        print("error")
    }
    

}

