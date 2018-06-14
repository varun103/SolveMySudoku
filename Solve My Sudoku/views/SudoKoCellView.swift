//
//  UICellView.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

enum CellType {
    case PUZZLE
    case CLUE
    case ANSWER
    case EMPTY
    case ERROR
    case INPUT_ERROR
}

class SudoKoCellView: UITextField, UITextFieldDelegate {
    
    let backgroundImage = "Rectangle"
    let backgroundImageGrey = "Rectangle_grey"
    
    // Cannot be edited by user
    // This is for the puzzle cells
    var locked = false
    
    var placeHolderBackgroundColor: UIColor!
    
    var type: CellType = .EMPTY {
        didSet {
            if type == CellType.ANSWER {
                self.locked = false
                self.background = UIImage(named: self.backgroundImage)!
            } else if type == CellType.CLUE {
                self.locked = false
            } else if type == CellType.PUZZLE {
                self.locked = true
                self.background = UIImage(named: self.backgroundImageGrey)!
            } else if (type == CellType.ERROR || type == CellType.INPUT_ERROR) {
                self.locked = false
            } else {
                self.locked = false
                self.background = UIImage(named: self.backgroundImage)!
                self.placeholder = ""
                self.text = ""
            }
            self.adjustFont()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clearsOnInsertion = true
        self.adjustsFontSizeToFitWidth = true
        self.delegate = self
        self.keyboardType = UIKeyboardType.numberPad
        let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        widthConstraint.priority = UILayoutPriority(900)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.lessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80)
        heightConstraint.priority = UILayoutPriority(900)
        self.addConstraints([widthConstraint, heightConstraint])
        
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
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
        //self.type = .EMPTY
        self.background = UIImage(named: self.backgroundImage)!
        self.placeholder = ""
        self.text = ""
        if self.type == .ERROR || self.type == .ANSWER || self.type == .CLUE {
            self.type = .ANSWER
        } else {
            self.type = .EMPTY
        }
    }
     
    
    /// Configures the cell if true else switches is back to original
    func setAsEmptyCell(_ value:Bool){
        if value {
            self.background = UIImage(named: self.backgroundImage)!
            //self.font = UIFont(name: TextFont.puzzleSolution, size: bounds.height*0.8)
            self.textColor = TextColors.regular
        } else {
            self.background = UIImage(named: self.backgroundImageGrey)!
            //self.font = UIFont(name: TextFont.puzzleInput, size: bounds.height*0.7)
            if self.type == .ERROR {
                self.textColor = TextColors.regular
            }
        }
    }
    
    func adjustFont() {
        if self.type == .ANSWER {
            self.font = UIFont(name: TextFont.userInput, size: bounds.height*0.75)
            self.textColor = TextColors.solution
        } else if self.type == .CLUE {
            self.font = UIFont(name: TextFont.puzzleInput, size: bounds.height*0.7)
            self.textColor = TextColors.clues
        } else if self.type == .PUZZLE {
            self.font = UIFont(name: TextFont.puzzleInput, size: bounds.height*0.7)
            self.textColor = TextColors.regular
        } else if (type == .ERROR || type == .INPUT_ERROR) {
            self.font = UIFont(name: TextFont.puzzleInput, size: bounds.height*0.7)
            self.textColor = TextColors.highlight
        } else {
            self.font = UIFont(name: TextFont.puzzleSolution, size: bounds.height*0.7)
            self.textColor = TextColors.regular
        }
    }
        
    /// Prevents user from entering more than one value
    /// Also prevents from entering the digit 0
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let x = textField.text?.lengthOfBytes(using: String.Encoding.utf8) {
            if (x >= 1) {
                
                if (self.locked) {
                    return false
                }
                // If user tries to type another digit
                // then erase the first one and take on the new one
                self.reset()
                return true
            }
        }
        if string == "0" {
            return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.placeHolderBackgroundColor = self.backgroundColor
        if !self.locked {
            self.tintColor = UIColor.clear
            self.backgroundColor = BackgroundColors.selectedCell
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.backgroundColor = self.placeHolderBackgroundColor
    }
    
    @objc func doneEditing() {
        self.resignFirstResponder()
    }
}
