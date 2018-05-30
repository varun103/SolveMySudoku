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
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    
    func testAlertOnLessInput() {
        
        let app = XCUIApplication()
        app.launch()
        
        let scrollViewsQuery = app.scrollViews
        let element = scrollViewsQuery.otherElements.containing(.button, identifier:"SolveButton1").children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0)
        element.children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 1).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
//        key.tap()
        element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
//        key2.tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        scrollViewsQuery.otherElements.buttons["Clue"].tap()
        
        XCTAssert(app.alerts.count == 1)
        
    }
    
    func testAlertOnDuplicateInput() {
        
        let app = XCUIApplication()
        app.launch()
        
        let element7 = app.scrollViews.otherElements.containing(.button, identifier:"SolveButton1").children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0)
        let element5 = element7.children(matching: .other).element(boundBy: 0)
        let element = element5.children(matching: .other).element(boundBy: 1)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        
        let element2 = element5.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .textField).element(boundBy: 0).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        key3.tap()
        element2.children(matching: .textField).element(boundBy: 2).tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        key4.tap()
        
        let element6 = element7.children(matching: .other).element(boundBy: 1)
        let element3 = element6.children(matching: .other).element(boundBy: 0)
        element3.children(matching: .textField).element(boundBy: 0).tap()
        key2.tap()
        key2.tap()
        element3.children(matching: .textField).element(boundBy: 1).tap()
        
        let key5 = app/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        key5.tap()
        
        let element4 = element7.children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 0)
        element4.children(matching: .textField).element(boundBy: 0).tap()
        
        let key6 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        key6.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["Delete"]/*[[".keyboards.keys[\"Delete\"]",".keys[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        key4.tap()
        key4.tap()
        
        let key7 = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7.tap()
        key7.tap()
        element4.children(matching: .textField).element(boundBy: 1).tap()
        key7.tap()
        key7.tap()
        element6.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 1).tap()
        key3.tap()
        
        
        let key_ = app/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key_.tap()
        key_.tap()
        
        let scrollViewsQuery = app.scrollViews
        let element2_ = scrollViewsQuery.otherElements.containing(.button, identifier:"SolveButton1").children(matching: .other).element(boundBy: 1)
        let element11 = element2_.children(matching: .other).element(boundBy: 0)
        let element_ = element11.children(matching: .other).element(boundBy: 2)
        element_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key2_ = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2_.tap()
        key2_.tap()
        element_.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0).tap()
        
        let key3_ = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3_.tap()
        key3_.tap()
        element11.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 1).tap()
        
        let key4_ = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4_.tap()
        key4_.tap()
        
        let element12 = element2_.children(matching: .other).element(boundBy: 1)
        let element5_ = element12.children(matching: .other).element(boundBy: 0)
        let element3_ = element5.children(matching: .other).element(boundBy: 0)
        element3_.children(matching: .textField).element(boundBy: 0).tap()
        
        let key5_ = app/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5_.tap()
        key5_.tap()
        element3_.children(matching: .textField).element(boundBy: 1).tap()
        
        let key6_ = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6_.tap()
        key6_.tap()
        
        let element4_ = element12.children(matching: .other).element(boundBy: 1)
        element4_.children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 2).tap()
        key2_.tap()
        key2_.tap()
        element5_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 0).tap()
        app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element6_ = element4_.children(matching: .other).element(boundBy: 1)
        element6_.children(matching: .textField).element(boundBy: 0).tap()
        
        let key7_ = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7_.tap()
        key7_.tap()
        element6_.children(matching: .textField).element(boundBy: 2).tap()
        key6_.tap()
        
        let element7_ = element12.children(matching: .other).element(boundBy: 2)
        element7_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key8 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key8.tap()
        key8.tap()
        element4_.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0).tap()
        key4_.tap()
        element5.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 1).tap()
        key2_.tap()
        key2_.tap()
        
        let element8 = element7_.children(matching: .other).element(boundBy: 2)
        element8.children(matching: .textField).element(boundBy: 1).tap()
        key6_.tap()
        element8.children(matching: .textField).element(boundBy: 2).tap()
        key5_.tap()
        key5_.tap()
        
        let element13 = element2_.children(matching: .other).element(boundBy: 2)
        let element9 = element13.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2)
        element9.children(matching: .textField).element(boundBy: 1).tap()
        key.tap()
        element9.children(matching: .textField).element(boundBy: 2).tap()
        key2_.tap()
        key2_.tap()
        
        let element10 = element13.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2)
        element10.children(matching: .textField).element(boundBy: 1).tap()
        key8.tap()
        key8.tap()
        element10.children(matching: .textField).element(boundBy: 2).tap()
        key7_.tap()
        element10.children(matching: .textField).element(boundBy: 0).tap()
        key7_.tap()
        key7_.tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        scrollViewsQuery.otherElements.buttons["SolveButton1"].tap()
                
        XCTAssert(app.alerts.count == 1)
    }
    
    func testSolve() {
        
        let app = XCUIApplication()
        app.launch()
        
        let element7 = app.scrollViews.otherElements.containing(.button, identifier:"SolveButton1").children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0)
        let element5 = element7.children(matching: .other).element(boundBy: 0)
        let element = element5.children(matching: .other).element(boundBy: 1)
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        
        let element2 = element5.children(matching: .other).element(boundBy: 2)
        element2.children(matching: .textField).element(boundBy: 0).tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        element2.children(matching: .textField).element(boundBy: 2).tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        
        let element6 = element7.children(matching: .other).element(boundBy: 1)
        let element3 = element6.children(matching: .other).element(boundBy: 0)
        element3.children(matching: .textField).element(boundBy: 0).tap()
        key2.tap()
        element3.children(matching: .textField).element(boundBy: 1).tap()
        
        let key5 = app/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        
        let element4 = element7.children(matching: .other).element(boundBy: 2).children(matching: .other).element(boundBy: 0)
        element4.children(matching: .textField).element(boundBy: 0).tap()
        
        let key6 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["Delete"]/*[[".keyboards.keys[\"Delete\"]",".keys[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        key4.tap()
        
        let key7 = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7.tap()
        element4.children(matching: .textField).element(boundBy: 1).tap()
        key7.tap()
        element6.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 1).tap()
        key3.tap()
        
        
        let key_ = app/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key_.tap()
        
        let scrollViewsQuery = app.scrollViews
        let element2_ = scrollViewsQuery.otherElements.containing(.button, identifier:"SolveButton1").children(matching: .other).element(boundBy: 1)
        let element11 = element2_.children(matching: .other).element(boundBy: 0)
        let element_ = element11.children(matching: .other).element(boundBy: 2)
        element_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key2_ = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2_.tap()
        element_.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0).tap()
        
        let key3_ = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3_.tap()
        element11.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 1).tap()
        
        let key4_ = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4_.tap()
        
        let element12 = element2_.children(matching: .other).element(boundBy: 1)
        let element5_ = element12.children(matching: .other).element(boundBy: 0)
        let element3_ = element5_.children(matching: .other).element(boundBy: 0)
        element3_.children(matching: .textField).element(boundBy: 0).tap()
        
        let key5_ = app/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5_.tap()
        element3_.children(matching: .textField).element(boundBy: 1).tap()
        
        let key6_ = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6_.tap()
        
        let element4_ = element12.children(matching: .other).element(boundBy: 1)
        element4_.children(matching: .other).element(boundBy: 0).children(matching: .textField).element(boundBy: 2).tap()
        key2_.tap()
        element5_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 0).tap()
        app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element6_ = element4_.children(matching: .other).element(boundBy: 1)
        element6_.children(matching: .textField).element(boundBy: 0).tap()
        
        let key7_ = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key7_.tap()
        element6_.children(matching: .textField).element(boundBy: 2).tap()
        key6_.tap()
        
        let element7_ = element12.children(matching: .other).element(boundBy: 2)
        element7_.children(matching: .other).element(boundBy: 1).children(matching: .textField).element(boundBy: 2).tap()
        
        let key8 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key8.tap()
        element4_.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 0).tap()
        key4_.tap()
        element5_.children(matching: .other).element(boundBy: 2).children(matching: .textField).element(boundBy: 1).tap()
        key2_.tap()
        
        let element8 = element7_.children(matching: .other).element(boundBy: 2)
        element8.children(matching: .textField).element(boundBy: 1).tap()
        element8.children(matching: .textField).element(boundBy: 2).tap()
        key5_.tap()
        
        let element13 = element2_.children(matching: .other).element(boundBy: 2)
        let element9 = element13.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2)
        element9.children(matching: .textField).element(boundBy: 1).tap()
        key.tap()
        element9.children(matching: .textField).element(boundBy: 2).tap()
        key2_.tap()
        
        let element10 = element13.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2)
        element10.children(matching: .textField).element(boundBy: 1).tap()
        key8.tap()
        key8.tap()
        element10.children(matching: .textField).element(boundBy: 2).tap()

        app.toolbars["Toolbar"].buttons["Done"].tap()
        scrollViewsQuery.otherElements.buttons["SolveButton1"].tap()
        
        XCTAssert(app.alerts.count == 0)
        
    }
}
