//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Md. Mahinur Rahman on 2/23/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi:BMI?
    
    mutating func calculateBmi(height:Float, weight:Float){
        let bmiValue  = weight/pow(height, 2) //custom swift method to use power
        let advice: String?
        let bacgroundColour: UIColor?
        if bmiValue < 18.5{
            advice = "Eat more!"
            bacgroundColour = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        else if(bmiValue<24.9){
            advice = "You are doing good!"
            bacgroundColour = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
        else{
            advice = "Start doing diet!"
            bacgroundColour = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
        bmi = BMI(bmiValue: bmiValue, advice: advice!, backgroundColour: bacgroundColour!)
    }
    
    func getBmiValue() -> Float{
        return bmi?.bmiValue ?? 0.00 //nil coalasing. if nil it will return 0.00
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "Found nil" //nil coalasing. if nil it will return 0.00
    }
    
    func getBacGroundColor() -> UIColor{
        return bmi?.backgroundColour ?? #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) //nil coalasing. if nil it will return 0.00
    }
}
