//
//  Rate.swift
//  CurrencyRate
//
//  Created by HACKERU on 15/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import Foundation

struct Rate{
    
    let code : String
    let value : Double
    
    var euroDescription : String?{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"

        return formatter.string(from: value as NSNumber)
    }
}
