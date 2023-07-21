//
//  CoinManager.swift
//  ByteCoinApp
//
//  Created by Ayça Işık on 21.07.2023.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "9B372B1E-7CB3-4C85-8F47-4832688030C8"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("zortt \(error!)")
                    return
                }
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
            }
            task.resume()
            
        }
        
    }
}

