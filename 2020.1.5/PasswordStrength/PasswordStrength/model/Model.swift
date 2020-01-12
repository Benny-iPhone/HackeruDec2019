//
//  Model.swift
//  PasswordStrength
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

enum Strength {
    case poor
    case meduim
    case strong
}

struct Model {
    var password : String
    
    func getStrengthByChars() -> Strength {
        
        let count = password.count
        guard count >= 6 else {
            return .poor
        }
        
        
        let containsDigits = password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
        let containsLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let containsUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let containsSpecialChars = password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()")) != nil
        
        guard containsDigits, (containsLowercase || containsUppercase) else {
            return .poor
        }
        
        if containsSpecialChars {
            return .strong
        } else {
            return .meduim
        }
        
        
    }
    
    func getStrength() -> Strength {
        let count = password.count
        switch count {
        case 0...6:
            return .poor
        case 7...10:
            return .meduim
        case let val where val > 10:
            //caser 11...Int.max:
            return .strong
        default:
            //negative
            return .poor
        }
    }
}
