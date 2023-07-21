//
//  ViewController.swift
//  ByteCoinApp
//
//  Created by Ayça Işık on 21.07.2023.
//

import UIKit
class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
   
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self

    }
    let coinManager = CoinManager()

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


