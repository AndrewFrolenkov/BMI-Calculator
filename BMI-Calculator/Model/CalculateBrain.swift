//
//  CalculateBrain.swift
//  BMI-Calculator
//
//  Created by Андрей Фроленков on 4.02.23.
//

import UIKit

struct CalculateBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) -> String {
        
        let bmi = weight / pow(height, 2)
        
        switch bmi {
            
        case ..<18.5:
            self.bmi = BMI(advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 18.5...24.9:
            self.bmi = BMI(advice: "Fir as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        case 24.9... :
            self.bmi = BMI(advice: "Eat less pies", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        default:
            print("Error")
        }

        let bmiString = String(format: "%.1f", bmi)
        
        return bmiString
    }
    
    func getadvice() -> String{
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
