//
//  ViewController.swift
//  CreditCardDemo
//
//  Created by Galileo Guzman on 4/2/18.
//  Copyright © 2018 Galileo Guzman. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtCvv: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCardNumber: UITextField!
    @IBOutlet weak var txtExpirationDate: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        txtExpirationDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker), for: UIControlEvents.valueChanged)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnSendPressed(_ sender: Any) {
        
        if validateFields(){
            
            txtExpirationDate.text = ""
            txtCardNumber.text = ""
            txtCvv.text = ""
            txtName.text = ""
            
            performSegue(withIdentifier: "segueShowDetail", sender: nil)
        }
        
        
        
        
        
    }
    
    func validateFields() -> Bool {
        
        var validate = false;
        
        // validate card name
        
        let letters = NSCharacterSet.letters
        let stName = txtName.text
        let range = stName?.rangeOfCharacter(from: letters)
        
        if range != nil {
            validate = true
        }else{
            validate = false
        }
        
        // validate card number 14 - 16
        
//        let creditCardNumbers = NSCharacterSet.decimalDigits
//        let stCardNumber = txtCardNumber.text
//        let rangeCardNumb = stCardNumber?.rangeOfCharacter(from: creditCardNumbers)
//        let countCreditCard = stCardNumber?.count
//        if rangeCardNumb != nil && ((countCreditCard! <= 16) && (countCreditCard! > 14)){
//            validate = true
//        }else{
//            validate = false
//        }
        
        // validate CVV
        
        let cvvNumbers = NSCharacterSet.decimalDigits
        let stCvv = txtCvv.text
        let rangeCvv = stCvv?.rangeOfCharacter(from: cvvNumbers)
        let countCvv = stCvv?.count
        if rangeCvv != nil && ((countCvv! <= 3) && (countCvv! > 0)){
            validate = true
        }else{
            validate = false
        }
        
        
        
        
        
        
        return validate
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        timeFormatter.dateFormat = "MM/yy"
        timeFormatter.date(from: txtExpirationDate.text!)
        
        txtExpirationDate.text = timeFormatter.string(from: sender.date)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if range.length > 0
        {
            return true
        }
        
        if textField == txtCardNumber {
            if range.location == 20
            {
                return false
            }
            
            var originalText = textField.text
            let countOriginalText = originalText?.count
            
            if countOriginalText! % 5 == 0
            {
                originalText?.append(" ")
                textField.text = originalText
            }
        }else if textField == txtCvv{
            if range.location == 3
            {
                return false
            }
        }
        
        
        
        return true
    }
    
    
}

