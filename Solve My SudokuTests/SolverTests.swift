//
//  Solve_My_SudokuTests.swift
//  Solve My SudokuTests
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import XCTest
@testable import Solve_My_Sudoku

class SolverTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRow() {
        let board: [[Int]] = [[1, 9, 3, 2, 4, 8, 6, 5, 7],
                              [7, 8, 4, 3, 5, 6, 1, 9, 2],
                              [5, 2, 6, 1, 7, 9, 8, 3, 4],
                              [8, 1, 7, 9, 3, 5, 2, 4, 6],
                              [3, 6, 9, 4, 1, 2, 5, 7, 8],
                              [2, 4, 5, 6, 8, 7, 3, 1, 9],
                              [9, 7, 1, 8, 6, 3, 4, 2, 5],
                              [4, 5, 8, 7, 2, 1, 9, 6, 3],
                              [6, 3, 2, 5, 9, 4, 7, 8, 1]]
        let s:Solver = Solver()
        XCTAssertEqual(board[0], s.getRow(board: board, xPos: 0))
        
    }
    
    func testColumn() {
        let board: [[Int]] = [[1, 9, 3, 2, 4, 8, 6, 5, 7],
                              [7, 8, 4, 3, 5, 6, 1, 9, 2],
                              [5, 2, 6, 1, 7, 9, 8, 3, 4],
                              [8, 1, 7, 9, 3, 5, 2, 4, 6],
                              [3, 6, 9, 4, 1, 2, 5, 7, 8],
                              [2, 4, 5, 6, 8, 7, 3, 1, 9],
                              [9, 7, 1, 8, 6, 3, 4, 2, 5],
                              [4, 5, 8, 7, 2, 1, 9, 6, 3],
                              [6, 3, 2, 5, 9, 4, 7, 8, 1]]
        let s:Solver = Solver()
        XCTAssertEqual([1,7,5,8,3,2,9,4,6], s.getColumn(board: board, yPos: 0))
    }
    
    func testSquare() {
        let board: [[Int]] = [[1, 9, 3, 2, 4, 8, 6, 5, 7],
                              [7, 8, 4, 3, 5, 6, 1, 9, 2],
                              [5, 2, 6, 1, 7, 9, 8, 3, 4],
                              [8, 1, 7, 9, 3, 5, 2, 4, 6],
                              [3, 6, 9, 4, 1, 2, 5, 7, 8],
                              [2, 4, 5, 6, 8, 7, 3, 1, 9],
                              [9, 7, 1, 8, 6, 3, 4, 2, 5],
                              [4, 5, 8, 7, 2, 1, 9, 6, 3],
                              [6, 3, 2, 5, 9, 4, 7, 8, 1]]
        let s:Solver = Solver()
        XCTAssertEqual([4,2,5,9,6,3,7,8,1], s.getSquare(board: board, xPos: 6, yPos: 7))
        XCTAssertEqual([9,3,5,4,1,2,6,8,7],s.getSquare(board: board, xPos: 3, yPos: 3))
        XCTAssertEqual([1,9,3,7,8,4,5,2,6],s.getSquare(board: board, xPos: 2, yPos: 1))
    }
    
    func testMissingElements() {
        let board: [[Int]] = [[0, 9, 3, 2, 4, 8, 6, 5, 7],
                              [7, 0, 4, 3, 5, 6, 1, 9, 2],
                              [5, 2, 0, 1, 7, 9, 8, 0, 4],
                              [8, 1, 0, 9, 3, 5, 2, 0, 0],
                              [3, 6, 9, 4, 1, 2, 5, 0, 8],
                              [2, 4, 5, 6, 8, 7, 3, 1, 9],
                              [9, 7, 1, 8, 6, 3, 4, 2, 5],
                              [4, 5, 8, 7, 0, 1, 9, 6, 3],
                              [6, 3, 2, 5, 9, 4, 7, 8, 1]]
        let s:Solver = Solver()
        XCTAssertEqual(Set([1]), s.getMissingElements(board: board, xPos: 0, yPos: 0))
        XCTAssertEqual(Set([8]), s.getMissingElements(board: board, xPos: 1, yPos: 1))
        XCTAssertEqual(Set([2]), s.getMissingElements(board: board, xPos: 7, yPos: 4))
        XCTAssertEqual(Set([]), s.getMissingElements(board: board, xPos: 8, yPos: 8))
        XCTAssertEqual(Set([4,7]), s.getMissingElements(board: board, xPos: 3, yPos: 7))
    }
    
    func testSolve() {
        var board: [[Int]] = [[6, 0, 2, 3, 4, 9, 7, 0, 0],
                              [0, 0, 1, 0, 0, 0, 0, 0, 3],
                              [3, 0, 7, 0, 1, 0, 2, 8, 0],
                              [0, 0, 9, 1, 0, 0, 0, 4, 0],
                              [0, 0, 0, 4, 2, 6, 0, 0, 0],
                              [0, 7, 0, 0, 0, 8, 1, 0, 0],
                              [0, 2, 4, 0, 6, 0, 8, 0, 7],
                              [8, 0, 0, 0, 0, 0, 6, 0, 0],
                              [0, 0, 6, 8, 9, 1, 4, 0, 2]]
        let s: Solver = Solver()
        if (s.solve(board: &board)) {
            for i in board {
                print(i)
            }
        }
    }
    
    func testFindDuplicatesAtHappyPath() {
        let array = [1,2,3,4,5,4,0,0,0]
        let s = Solver()
        let duplicatePositions = s.findDuplicatesAt(in: array)
        XCTAssertTrue(duplicatePositions.count == 2)
        XCTAssertTrue(duplicatePositions.contains(3))
        XCTAssertTrue(duplicatePositions.contains(5))
    }
    
    func testFindDuplicatesAtEmptyArray() {
        let array:[Int] = []
        let s = Solver()
        let duplicatePositions = s.findDuplicatesAt(in: array)
        XCTAssertTrue(duplicatePositions.count == 0)
    }
    
    func testFindDuplicatesAtArrayWithZerosOnly() {
        let array:[Int] = [0,0,0,0,0,0,0,0]
        let s = Solver()
        let duplicatePositions = s.findDuplicatesAt(in: array)
        XCTAssertTrue(duplicatePositions.count == 0)
    }
    
    func testFindDuplicatesAtInBoardHappyPath() {
        let board: [[Int]] = [[6, 0, 6, 3, 4, 9, 7, 0, 0],
                              [2, 0, 1, 0, 0, 0, 0, 0, 3],
                              [3, 0, 7, 0, 1, 3, 2, 8, 0],
                              [0, 0, 9, 1, 0, 0, 0, 4, 0],
                              [4, 0, 0, 4, 2, 6, 0, 0, 0],
                              [0, 7, 0, 0, 0, 8, 1, 0, 0],
                              [0, 2, 4, 0, 6, 0, 8, 0, 7],
                              [8, 7, 0, 0, 0, 0, 6, 0, 0],
                              [0, 0, 6, 8, 9, 1, 4, 0, 2]]
        let s = Solver()
        let duplicatePositions = s.findDuplicatesAt(in: board)
        //XCTAssertTrue(duplicatePositions.count == 8)
    }
    
    func testCreate() {
        let s = Solver()
        for i in 0...1000 {
            var temp:[Int]=[]
            let x = s.createPuzzle()
            print(i)

            if i == 0 {
                temp = x[1]
            }
        }
    }
}
