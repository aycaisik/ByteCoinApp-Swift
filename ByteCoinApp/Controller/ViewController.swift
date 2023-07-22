//
//  ViewController.swift
//  ByteCoinApp
//
//  Created by Ayça Işık on 21.07.2023.
//

import UIKit
class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate,CoinManagerDelegate{
   
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self

    }
    
    func didUpdatePrice(price: String, currency: String) {
            
            //Remember that we need to get hold of the main thread to update the UI, otherwise our app will crash if we
            //try to do this from a background thread (URLSession works in the background).
            DispatchQueue.main.async {
                self.bitcoinLabel.text = price
                self.currencyLabel.text = currency
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    
    //*******************
    
    
    
    
    var coinManager = CoinManager()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return coinManager.currencyArray.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return coinManager.currencyArray[row]
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         let selectedCurrency = coinManager.currencyArray[row]
         coinManager.getCoinPrice(for: selectedCurrency)
     }
    
    
        
    }


