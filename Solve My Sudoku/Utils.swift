//
//  Utils.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/7/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation

class Utils {
    
    static func dateString(forInterval: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(forInterval))!
        return formattedString
    }
    
}
