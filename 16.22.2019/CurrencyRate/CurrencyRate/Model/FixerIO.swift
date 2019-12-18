//
//  FixerIO.swift
//  CurrencyRate
//
//  Created by HACKERU on 15/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import Foundation



struct FixerIO {
    typealias Callback = ([Rate])->Void
    
    private let apiKey = "e54fd9fd13563bbe132644f20eb06de7"
    private let baseURL = "http://data.fixer.io/api"
    
    func getRates(with callback : @escaping Callback) { //@escaping for async
        //quick and dirty way to build http request, don't do that in interview
        let urlString = baseURL + "/latest?access_key=" + apiKey
        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else{ //no data received
                callback([])
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .init()) else{
                callback([])
                return
            }
            
            guard let dict = json as? [String:Any],
                let rates = dict["rates"] as? [String:Double] else{
                    callback([])
                    return
            }
            
            let result = rates.compactMap{ Rate(code: $0.key, value: $0.value) }
            callback(result)
            
        }.resume()
        
    }
    
}
