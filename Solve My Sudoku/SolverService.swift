//
//  SolverService.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/3/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

/// Sudoku Solver Service
class SolverService {
    
    var input: [[SudoKoCellView]]
    var convertedInput: [[Int]] = [[]]
    
    init(userInput: [[SudoKoCellView]]) {
        self.input = userInput
        self.convertedInput = self.convert(cellViewArray: self.input)
    }
    
    func solve() {
        DispatchQueue.global().async {
            let solve = Solver()
            let result = solve.solve(board: &self.convertedInput)
            
            if result {
                DispatchQueue.main.async {
                    self.convertBack()
                }
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Sorry", message: "Unable solve puzzle. Please check the input and try again", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: { _ in
                        print("a")
                    }) )
                    var rootViewController = UIApplication.shared.keyWindow?.rootViewController
                    if let navigationController = rootViewController as? UINavigationController {
                        rootViewController = navigationController.viewControllers.first
                    }
                    if let tabBarController = rootViewController as? UITabBarController {
                        rootViewController = tabBarController.selectedViewController
                    }
                    rootViewController?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    private func convertBack() {
        var rowNumber = 0
        for row in self.convertedInput {
            var columnNumber = 0
            for column in row {
                self.input[rowNumber][columnNumber].integerValue = column
                columnNumber += 1
            }
            rowNumber += 1
        }
    }
    
    private func convert(cellViewArray: [[SudoKoCellView]]) -> [[Int]] {
        var intArray = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
        var rowNumber = 0
        for row in cellViewArray {
            var columnNumber = 0
            for column in row {
                intArray[rowNumber][columnNumber] = column.integerValue
                columnNumber += 1
            }
            rowNumber += 1
        }
        return intArray
    }
}
