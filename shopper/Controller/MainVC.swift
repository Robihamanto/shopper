//
//  ViewController.swift
//  shopper
//
//  Created by Robihamanto on 07/10/17.
//  Copyright © 2017 bcc. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTextField: CurrencyTextField!
    @IBOutlet weak var itemPriceTextField: CurrencyTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let calculate = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculate.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        calculate.setTitle("Calculate", for: .normal)
        calculate.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculate.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTextField.inputAccessoryView = calculate
        itemPriceTextField.inputAccessoryView = calculate
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }

    @objc func calculate(){
        if let wageText = wageTextField.text, let itemPrice = itemPriceTextField.text {
            if let wage = Double(wageText), let price = Double(itemPrice) {
                resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                view.endEditing(true)
            }
        }
    }
    
    @IBAction func clearCalculatorButtonDidTap(_ sender: Any) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTextField.text = ""
        itemPriceTextField.text = ""
    }
    
}

