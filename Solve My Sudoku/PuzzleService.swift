//
//  Puzzle.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/25/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit


class Puzzle {
    
    var solver: Solver
    var solvedPuzzle:[[Int]]
    var sudokuBoard:[[SudoKoCellView]] = [[]]
    let settings: Settings = Settings.getInstance()

    init(sudokuBoard:[[SudoKoCellView]]) {
        self.solver = Solver()
        self.solvedPuzzle = solver.createPuzzle()
        self.sudokuBoard = sudokuBoard
    }
    
    func new() {
        var cells = self.getEmptyCells()

        for _ in 0...settings.puzzleSize {
            let randomIndex = arc4random_uniform(UInt32((cells.count)))
            let cell = cells[Int(randomIndex)]
            self.updateThisResult(row: cell.0, column: cell.1,as: .PUZZLE)
            cells.remove(at: Int(randomIndex))
        }
        
        let remaining_cells = self.getEmptyCells()
        
        for cell in remaining_cells {
            self.sudokuBoard[cell.0][cell.1].type = .ANSWER
        }
    }
    
    func updateThisResult(row:Int, column: Int, as type: CellType) {
        self.sudokuBoard[row][column].integerValue = self.solvedPuzzle[row][column]
        self.sudokuBoard[row][column].type = type
    }
    
    func getEmptyCells() -> [(Int, Int)] {
        var emptyIndices:[(Int,Int)] = []
        var rowCount = 0
        for row in self.sudokuBoard {
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
    

}
