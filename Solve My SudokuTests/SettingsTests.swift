//
//  SettingsTests.swift
//  Solve My SudokuTests
//
//  Created by Varun Ajmera on 6/2/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import XCTest
@testable import Solve_My_Sudoku

class SettingsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChangeDifficultyLevel() {
        let settings: Settings = Settings.getInstance()
        XCTAssertEqual(DifficultyLevel.EASY, settings.level)
        settings.level = DifficultyLevel.MEDIUM
        XCTAssertEqual(DifficultyLevel.MEDIUM, settings.level)
        
        let settingsNew: Settings = Settings.getInstance()
        XCTAssertEqual(DifficultyLevel.MEDIUM, settingsNew.level)
        settingsNew.level = DifficultyLevel.HARD
        
        XCTAssertEqual(DifficultyLevel.HARD, settings.level)

    }
    
    func testCheckPuzzleSize() {
        let settings: Settings = Settings.getInstance()
        XCTAssertEqual(DifficultyLevel.EASY, settings.level)
        XCTAssertTrue(settings.puzzleSize >= 28)
        
        settings.level = DifficultyLevel.MEDIUM
        XCTAssertEqual(DifficultyLevel.MEDIUM, settings.level)
        XCTAssertTrue(settings.puzzleSize >= 22)
        XCTAssertTrue(settings.puzzleSize < 29)

        let settingsNew: Settings = Settings.getInstance()
        XCTAssertEqual(DifficultyLevel.MEDIUM, settingsNew.level)
        settingsNew.level = DifficultyLevel.HARD
        
        XCTAssertEqual(DifficultyLevel.HARD, settings.level)
        XCTAssertTrue(settingsNew.puzzleSize >= 17)
        XCTAssertTrue(settingsNew.puzzleSize < 23)


    }
    
}
