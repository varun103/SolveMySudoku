//
//  Solve_My_SudokuUITests.swift
//  Solve My SudokuUITests
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import XCTest

class Solve_My_SudokuUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testExample() {
        
        let app = XCUIApplication()
        let solveMySudokuElementsQuery = app.otherElements.containing(.navigationBar, identifier:"Solve My Sudoku")
        let element2 = solveMySudokuElementsQuery.children(matching: .other).element(boundBy: 2)
        let textField = element2.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.tap()
        
        let element = solveMySudokuElementsQuery.children(matching: .other).element(boundBy: 1)
        let element3 = element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0)
        let textField2 = element3.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.tap()
        element3.children(matching: .textField).element(boundBy: 2).tap()
        element.children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 1).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        element2.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        solveMySudokuElementsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 1).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.otherElements.containing(.navigationBar, identifier:"Solve My Sudoku").element.tap()
        app.buttons["Button"].tap()
        
    }
    
}
