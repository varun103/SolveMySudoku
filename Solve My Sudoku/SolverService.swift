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
    
    func solve(completion: @escaping()-> Void ) {
        let solve = Solver(board: self.convertedInput)
        solve.solve(board: &self.convertedInput)
        completion()
    }

    private func convert(cellViewArray: [[SudoKoCellView]]) -> [[Int]] {
        var intArray:[[Int]] = [[]]
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
