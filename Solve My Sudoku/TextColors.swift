//
//  Colors.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/22/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

struct TextColors {
    static let highlight = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 100/100)
    static let regular = UIColor(red: 49/255, green: 54/255, blue: 50/255, alpha: 100)
    static let clues = UIColor(red: 188/255, green: 70/255, blue: 118/255, alpha: 100)
    //static let solution = UIColor(red: 109/255, green: 146/255, blue: 155/255, alpha: 100)
    static let solution = UIColor(red: 0/255, green: 63/255, blue: 190/255, alpha: 100)

    static let correct = UIColor(red: 95/255, green: 168/255, blue:116/255, alpha: 100)
    
    static let notifications = UIColor(red: 125/255, green: 156/255, blue: 159/255, alpha: 100)
}

struct TextFont {
    static let puzzleInput = "AvenirNext-Medium"
    static let puzzleSolution = "AvenirNext-Regular"
    static let avenirMedium = "AvenirNext-Medium"
    static let avenirDemiBold = "AvenirNext-DemiBold"
    static let hintButton = "ChalkboardSE-Bold"
    static let userInput = "ChalkboardSE-Light"

    static let notifications = "HelveticaNeue-Medium"
}
