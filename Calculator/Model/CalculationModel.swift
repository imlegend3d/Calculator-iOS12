//
//  CalculationModel.swift
//  Calculator
//
//  Created by David on 2019-04-17.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationModel {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, cal: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{
        
        guard let n = number else{fatalError()}
        var num = n
        if symbol == "+/-"{
            return num * -1
        } else if symbol == "AC"{
            num = 0.0
            performTwoNumberCalculation(n2: num)
            intermediateCalculation = nil
            return num
        } else if symbol == "%"{
            return num/100
        } else if symbol == "r" {
            return performTwoNumberCalculation(n2: num)
        } else if symbol == "=" {
            return performTwoNumberCalculation(n2: num)
        } else {
            intermediateCalculation = (n1: num, cal: symbol)
        }
        return nil
    }
    
    mutating private func performTwoNumberCalculation(n2: Double)-> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.cal {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError()
            }
        }
        return nil
    }
}
