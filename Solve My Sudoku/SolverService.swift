//
//  SolverService.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/3/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

/// Sudoku Solver Service
/// Intermediary between the user input and Solver
class SolverService {
    
    var puzzle: [[SudoKoCellView]]
    var convertedInput: [[Int]] = [[]]
    private(set) var solved:Bool
    
    init(userInput: [[SudoKoCellView]]) {
        self.puzzle = userInput
        self.solved = false
        self.convertedInput = self.convertPuzzleToIntegerMatrix(cellViewArray: self.puzzle)
    }
    
    func checkForDuplicates() -> [(Int,Int)]{
        let solver = Solver()
        return solver.findDuplicatesAt(in: self.convertedInput)
    }
    
    func updatePuzzle(userInput: [[SudoKoCellView]]) {
        self.puzzle = userInput
        self.convertedInput = self.convertPuzzleToIntegerMatrix(cellViewArray: self.puzzle)
    }
    
    func userInputCellCount() -> Int {
        return self.puzzle.joined().filter {$0.hasText}.count
    }
    
    func getEmptyCells() -> [(Int, Int)] {
        var emptyIndices:[(Int,Int)] = []
        var rowCount = 0
        for row in self.puzzle {
            var columnCount = 0
            for column in row {
                if !column.hasTextInput {
                    emptyIndices.append((rowCount,columnCount))
                }
                columnCount += 1
            }
            rowCount += 1
        }
        return emptyIndices
    }
        
    func solve(completion:@escaping (_ result: Bool) -> Void) {
        
        DispatchQueue.global().async {
            let solve = Solver()
            let result = solve.solve(board: &self.convertedInput)
            if result {
                self.solved = true
            }
            completion(result)
        }
    }
    
    func updateThisResult(row:Int, column: Int) {
        self.puzzle[row][column].integerValue = self.convertedInput[row][column]
    }
    
    func updatePuzzle() {
        var rowNumber = 0
        for row in self.convertedInput {
            var columnNumber = 0
            for column in row {
                self.puzzle[rowNumber][columnNumber].integerValue = column
                columnNumber += 1
            }
            rowNumber += 1
        }
    }
    
    func convertPuzzleToIntegerMatrix(cellViewArray: [[SudoKoCellView]]) -> [[Int]] {
        var int2DArray = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
        var rowNumber = 0
        for row in cellViewArray {
            var columnNumber = 0
            for column in row {
                int2DArray[rowNumber][columnNumber] = column.integerValue
                columnNumber += 1
            }
            rowNumber += 1
        }
        return int2DArray
    }
}
