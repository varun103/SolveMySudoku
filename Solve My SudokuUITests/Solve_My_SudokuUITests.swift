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
    
    func test2() {
        
        
        let app = XCUIApplication()
        let element7 = app.scrollViews.otherElements.containing(.button, identifier:"Button").children(matching: .other).element
        let element3 = element7.children(matching: .other).element(boundBy: 0)
        let element8 = element3.children(matching: .other).element(boundBy: 0)
        let element = element8.children(matching: .other).element(boundBy: 0)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        element.children(matching: .textField).element(boundBy: 2).tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        
        let element2 = element8.children(matching: .other).element(boundBy: 1)
        element2.children(matching: .textField).element(boundBy: 0).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        element2.children(matching: .textField).element(boundBy: 1).tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        key4.tap()
        element2.children(matching: .textField).element(boundBy: 2).tap()
        
        let key5 = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        key5.tap()
        element8.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0).tap()
        
        let key6 = app/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        key6.tap()
        
        let element4 = element3.children(matching: .other).element(boundBy: 1)
        element4.children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 2).tap()
        
        let key7 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7.tap()
        key7.tap()
        element4.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 2).tap()
        key3.tap()
        key3.tap()
        
        let element9 = element3.children(matching: .other).element(boundBy: 2)
        let element5 = element9.children(matching: .other).element(boundBy: 0)
        element5.children(matching: .textField).element(boundBy: 0).tap()
        key3.tap()
        key3.tap()
        element5.children(matching: .textField).element(boundBy: 2).tap()
        key6.tap()
        key6.tap()
        
        let element10 = element9.children(matching: .other).element(boundBy: 1)
        let textField = element10.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        key7.tap()
        key7.tap()
        
        let textField2 = element10.children(matching: .textField).element(boundBy: 2)
        textField2.tap()
        key2.tap()
        key2.tap()
        textField.tap()
        
        let textField3 = element10.children(matching: .textField).element(boundBy: 1)
        textField3.tap()
        textField.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["Delete"]/*[[".keyboards.keys[\"Delete\"]",".keys[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        textField3.tap()
        key7.tap()
        key7.tap()
        textField2.tap()
        deleteKey.tap()
        deleteKey.tap()
        
        let element6 = element9.children(matching: .other).element(boundBy: 2)
        element6.children(matching: .textField).element(boundBy: 0).tap()
        key2.tap()
        key2.tap()
        element6.children(matching: .textField).element(boundBy: 1).tap()
        
        let key8 = app/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key8.tap()
        key8.tap()
        element7.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 2).tap()
        key5.tap()
        
        app.scrollViews.otherElements.containing(.button, identifier:"Button").children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 1).tap()
        app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
}
