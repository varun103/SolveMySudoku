//
//  Solver.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/21/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class Solver {
    
    var EMPTY = 0
    
    let indices = Set([1,2,3,4,5,6,7,8,9])
    
    var board:[[Int]]
    
    init(board: [[Int]]) {
        self.board = board
    }
    
    func solve(board: inout [[Int]]) -> Bool {
        
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
                            if !solve(board: &board) {
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
            return Array(arrayLiteral: board[0][3], board[1][3], board[2][3], board[0][4], board[1][4], board[2][4], board[0][5], board[1][5], board[2][5])
        }
        else if ( 2 < xPos && xPos <= 5 && yPos > 2 && yPos <= 5) {
            return Array(arrayLiteral: board[3][3], board[4][3], board[5][3], board[3][4], board[4][4], board[5][4], board[3][5], board[4][5], board[5][5])
        }
        else if ( xPos > 5 && yPos > 2 && yPos <= 5) {
            return Array(arrayLiteral: board[6][3], board[7][3], board[8][3], board[6][4], board[7][4], board[8][4], board[6][5], board[7][5], board[8][5])
        }
        else if (  xPos <= 2 && yPos > 5 ) {
            return Array(arrayLiteral: board[0][6], board[0][7], board[0][8], board[1][6], board[1][7], board[1][8], board[2][6], board[2][7], board[2][8])
        }
        else if ( 2 < xPos && xPos <= 5 && yPos > 5) {
            return Array(arrayLiteral: board[3][6], board[4][7], board[5][8], board[3][6], board[4][7], board[5][8], board[3][6], board[4][7], board[5][8])
        }
        return Array(arrayLiteral: board[6][6], board[6][7], board[6][8], board[7][6], board[7][7], board[7][8], board[8][6], board[8][7], board[8][8])
    }
}
