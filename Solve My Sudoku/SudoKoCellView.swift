//
//  UICellView.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class SudoKoCellView: UITextField, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clearsOnInsertion = true
        self.adjustsFontSizeToFitWidth = true
        self.delegate = self
        self.keyboardType = UIKeyboardType.numberPad
        self.background = UIImage(named: "Rectangle_light")!
        self.placeholder = ""
        let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        self.addConstraints([widthConstraint, heightConstraint])
    
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        toolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target:self , action: #selector(self.doneEditing))
        toolBar.setItems([flexSpace,doneButton], animated: true)
        
        self.inputAccessoryView = toolBar
    }
    
    /// If this cell has any input text
    var hasTextInput: Bool {
        return self.text?.lengthOfBytes(using: String.Encoding.utf8) == 1 
    }
    
    /// Input text is in string format. This returns that String as an Integer - if Empty returns 0
    var integerValue: Int {
        if let text = self.text {
            if self.hasTextInput {
                return Int(text)!
            }
        }
        return 0
    }
    
    /// Greys out the cell if true else switches is back to original
    func greyOut(_ input:Bool){
        if input {
            self.background = UIImage(named: "Rectangle_grey")!
        } else {
            self.background = UIImage(named: "Rectangle3")!
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
