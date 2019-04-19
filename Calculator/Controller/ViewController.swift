//
//  ViewController.swift
//  Calculator
//
//  Created by David on 2019-04-01..
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
           guard let number = Double(displayLabel.text!) else {fatalError("Error Converting Double")}
            return number
        }
        set {
            displayLabel.text = String (newValue)
        }
    }
    
     //private lazy var calculator = CalculationModel(number: displayValue)
    private var calculator = CalculationModel()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle != "="{
            
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: "r"){
                displayValue = result
                calculator.setNumber(result)
            }
            
            isFinishedTypingNumber = true
            if let calcMethod = sender.currentTitle {
                if let result = calculator.calculate(symbol: calcMethod){
                    displayValue = result
                }
            }
            
        } else if sender.currentTitle == "="{
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: "="){
                displayValue = result
                calculator.setNumber(0)
                if let result = calculator.calculate(symbol: "+"){
                    displayValue = result
                    calculator.setNumber(0)
                }
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }
}

