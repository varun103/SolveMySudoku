//
//  Solver.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/21/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

/// Heart of the Sudoku Puzzle
class Solver {
    
    var EMPTY = 0
    
    let indices = Set([1,2,3,4,5,6,7,8,9])
    
    func solve(board: inout [[Int]], startTime: Double = Date().timeIntervalSince1970, maxTime: Double = 17) -> Bool {
        
        if Date().timeIntervalSince1970 - startTime > maxTime {
            return false
        }
        
        var notDone = false
        for x in (0...8) {
            for y in (0...8) {
                if board[x][y] == 0 {
                    notDone = true
                    let missingElements = self.getMissingElements(board: board, xPos: x, yPos: y)
                    if missingElements.count == 0 {
                        return false
                    }
                    else {
                        for element in missingElements {
                            board[x][y] = element
                            if !solve(board: &board, startTime: startTime) {
                                board[x][y] = 0
                            } else {
                                break
                            }
                        }
                        if board[x][y] == 0 {
                            return false
                        } else {
                            return true
                        }
                    }
                }
            }
        }
        if !notDone {
            return true
        }
        return false
    }
    
    func createPuzzle() -> [[Int]] {
        var board = self.createPuzzleInput()
        while !self.solve(board: &board, maxTime: 2) {
            board = self.createPuzzleInput()
        }
        return board
    }
    
    private func createPuzzleInput() -> [[Int]] {
        var board:[[Int]] = [[Int]] (repeating: [Int](repeating: 0, count: 9), count: 9)
        board[0][0] = Int(arc4random_uniform(8)+1)
        board[Int(arc4random_uniform(2)+1)][4] = Int(arc4random_uniform(8)+1)
        board[3][1] = Int(arc4random_uniform(8)+1)
        board[5][6] = Int(arc4random_uniform(8)+1)
        board[6][2] = Int(arc4random_uniform(8)+1)
        board[Int(arc4random_uniform(2)+7)][8] = Int(arc4random_uniform(8)+1)
        return board
    }
    
    /// Finds the duplicate elements on the board
    func findDuplicatesAt(in board: [[Int]]) -> [(Int,Int)]{
        var duplicatePositions:[(Int,Int)] = []
        var rowNumber = 0
        for row in board {
            let rowPositions = self.findDuplicatesAt(in: row)
            rowPositions.forEach { position in
                duplicatePositions.append((rowNumber,position))
            }
            rowNumber = rowNumber + 1
        }
        
        for column in 0...8 {
            let columnPositions = self.findDuplicatesAt(in: getColumn(board: board, yPos: column))
            columnPositions.forEach { position in 
                duplicatePositions.append((position, column))
            }
        }
        
        for row in [0,3,6] {
            for column in [0,3,6] {
                let squarePositions = self.findDuplicatesAt(in: getSquare(board: board, xPos: row, yPos: column))
                squarePositions.forEach { position in
                    let xPosInSquare = position / 3
                    let yPosInSquare = position % 3
                    duplicatePositions.append((row + xPosInSquare, column + yPosInSquare))
                }
            }
        }
        
        return duplicatePositions
    }
    
    /// Finds and returns positions of duplicate elements in the array provided
    /// Ignores if the element is 0
    func findDuplicatesAt(in array:[Int]) -> [Int] {
        var index = 0
        var duplicatePositions:[Int] = []
        var elementToPositions:[Int:[Int]] = [:]
        for element in array {
            if element != 0 {
                if elementToPositions[element] != nil {
                    elementToPositions[element]?.append(index)
                } else {
                    elementToPositions[element] = [index]
                }
            }
            index = index + 1
        }
        for key in elementToPositions.keys {

            if (elementToPositions[key]?.count)! > 1 {
                elementToPositions[key]?.forEach { position in
                    duplicatePositions.append(position)
                }
            }
        }
        return duplicatePositions
    }
    
    func getMissingElements(board: [[Int]], xPos:Int, yPos:Int) -> Set<Int> {
        let row = Set(getRow(board: board, xPos: xPos))
        let column = Set(getColumn(board:board,yPos:yPos))
        let square = Set(getSquare(board: board, xPos: xPos, yPos: yPos))
        let x = row.union(column.union(square))
        return indices.subtracting(x)
    }
    
    func getRow(board: [[Int]], xPos: Int) -> [Int] {
        return board[xPos]
    }
    
    func getColumn(board:[[Int]], yPos: Int) -> [Int] {
        var temp:[Int] = []
        for i in (0...8) {
            temp.append(board[i][yPos])
        }
        return temp
    }
    
    func getSquare(board:[[Int]], xPos:Int, yPos:Int) -> [Int] {
        
        if (xPos <= 2 && yPos <= 2 ) {
            return Array(arrayLiteral: board[0][0], board[0][1], board[0][2], board[1][0], board[1][1], board[1][2], board[2][0], board[2][1], board[2][2])
        }
        else if ( 2 < xPos && xPos <= 5 && yPos <= 2) {
            return Array(arrayLiteral: board[3][0], board[3][1], board[3][2], board[4][0], board[4][1], board[4][2], board[5][0], board[5][1], board[5][2])
        }
        else if ( xPos > 5 && yPos <= 2) {
            return Array(arrayLiteral: board[6][0], board[6][1], board[6][2], board[7][0], board[7][1], board[7][2], board[8][0], board[8][1], board[8][2])
        }
        else if ( xPos <= 2 && yPos > 2 && yPos <= 5) {
            return Array(arrayLiteral: board[0][3], board[0][4], board[0][5], board[1][3], board[1][4], board[1][5], board[2][3], board[2][4],  board[2][5])
        }
        else if ( 2 < xPos && xPos <= 5 && yPos > 2 && yPos <= 5) {
            return Array(arrayLiteral: board[3][3], board[3][4], board[3][5], board[4][3], board[4][4], board[4][5], board[5][3],  board[5][4], board[5][5])
        }
        else if ( xPos > 5 && yPos > 2 && yPos <= 5) {
            return Array(arrayLiteral: board[6][3], board[6][4], board[6][5], board[7][3], board[7][4], board[7][5], board[8][3], board[8][4], board[8][5])
        }
        else if (  xPos <= 2 && yPos > 5 ) {
            return Array(arrayLiteral: board[0][6], board[0][7], board[0][8], board[1][6], board[1][7], board[1][8], board[2][6], board[2][7], board[2][8])
        }
        else if ( 2 < xPos && xPos <= 5 && yPos > 5) {
            return Array(arrayLiteral: board[3][6], board[3][7], board[3][8], board[4][6], board[4][7], board[4][8], board[5][6], board[5][7], board[5][8])
        }
        return Array(arrayLiteral: board[6][6], board[6][7], board[6][8], board[7][6], board[7][7], board[7][8], board[8][6], board[8][7], board[8][8])
    }
}
