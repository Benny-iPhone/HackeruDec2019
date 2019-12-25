//
//  FixerIO.swift
//  CurrencyRate
//
//  Created by HACKERU on 15/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import Foundation



struct FixerIO {
    //A function that receive array of Rate, and return Void, can be named 'Callback'
    typealias Callback = ([Rate])->Void
    
    //some helpful constants
    private let apiKey = "e54fd9fd13563bbe132644f20eb06de7"
    private let baseURL = "http://data.fixer.io/api"
    
    //call this method to get the data from FixerIO server
    func getRates(with callback : @escaping Callback) { //@escaping for async
        //quick and dirty way to build http request, don't do that in interview
        let urlString = baseURL + "/latest?access_key=" + apiKey
        let url = URL(string: urlString)!

        //URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //validate that data is not nil
            guard let data = data else{ //no data received
                callback([])
                return
            }
            //parse the binary data to json object (array of dictionary, return nil in case of failure)
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .init()) else{
                callback([])
                return
            }
            //cast the json result to dictionary
            guard let dict = json as? [String:Any],
                //read the 'rates' dictionary
                let rates = dict["rates"] as? [String:Double] else{
                    callback([])
                    return
            }
            //serialize 'rates' to array of Rate
            let result : [Rate] = rates.compactMap{ Rate(code: $0.key, value: $0.value) }
            callback(result)
            
        }.resume()
        
    }
    
}
