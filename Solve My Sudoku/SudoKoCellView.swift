//
//  UICellView.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class SudoKoCellView: UITextField, UITextFieldDelegate {
    
    let backgroundImage = "Rectangle"
    let backgroundImageGrey = "Rectangle_grey"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clearsOnInsertion = true
        self.adjustsFontSizeToFitWidth = true
        self.delegate = self
        self.keyboardType = UIKeyboardType.numberPad
        let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        self.addConstraints([widthConstraint, heightConstraint])
        
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        toolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target:self , action: #selector(self.doneEditing))
        toolBar.setItems([flexSpace,doneButton], animated: true)
        
        self.inputAccessoryView = toolBar
        self.reset()
    }
    
    /// If this cell has any input text
    var hasTextInput: Bool {
        return self.text?.lengthOfBytes(using: String.Encoding.utf8) == 1 
    }
    
    /// Input text is in string format. This returns that String as an Integer - if Empty returns 0
    var integerValue: Int {
        set(value) {
            self.text = String(value)
        }
        
        get{
            if let text = self.text {
                if self.hasTextInput {
                    return Int(text)!
                }
            }
            return 0
        }
    }
    
    func reset() {
        self.placeholder = ""
        self.text = ""
        self.background = UIImage(named: self.backgroundImage)!
        self.font = UIFont(name: "AvenirNext-Bold", size: 21)
        self.textColor = UIColor(red: 49/255, green: 54/255, blue: 50/255, alpha: 100)

    }
    
    /// Configures the cell if true else switches is back to original
    func setAsEmptyCell(_ value:Bool){
        if value {
            self.background = UIImage(named: self.backgroundImage)!
            self.font = UIFont(name: "AvenirNext-Regular", size: 25)
            self.textColor = UIColor(red: 49/255, green: 54/255, blue: 50/255, alpha: 80/100)
        } else {
            self.background = UIImage(named: self.backgroundImageGrey)!
        }
    }
    
    /// Prevents user from entering more than one value
    /// Also prevents from entering the digit 0
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let x = textField.text?.lengthOfBytes(using: String.Encoding.utf8) {
            if (x >= 1) {
                if (string == ""){
                    return true
                }
                return false
            }
        }
        if string == "0" {
            return false
        }
        return true
    }
    
    @objc func doneEditing() {
        self.resignFirstResponder()
    }
}
