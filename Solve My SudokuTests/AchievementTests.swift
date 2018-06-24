//
//  AchievementTests.swift
//  Solve My SudokuTests
//
//  Created by Varun Ajmera on 6/21/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//


import XCTest
@testable import Solve_My_Sudoku

class AchievementTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChange() {
        let achievements = UserAchievements.getInstance()
        
        achievements.EASY_FIVE.addCount()
    }
    
    func testSaveAchievement() {
        let achievement = CountBasedAchievement(stars: 5, description: "some", initialCount: 1, limit: 10, userDefaultKey: "testAchieve")
        XCTAssertEqual(0, achievement.currentCount)
        
        achievement.addCount()
        
        let achievement2 = CountBasedAchievement(stars: 2, description: "random", initialCount: 2, limit: 20, userDefaultKey: "testAchieve")
        
        XCTAssertEqual(1, achievement2.currentCount)
        XCTAssertEqual(1, achievement.currentCount)
        
        UserDefaults().removeObject(forKey: "testAchieve")
    }
    
    func testEasyFiveUserAchievement() {
        let achievement = UserAchievements.getInstance().EASY_FIVE
        achievement.addCount()
        achievement.addCount()
        XCTAssertFalse(achievement.earned)
        XCTAssertEqual(2, achievement.currentCount)
        achievement.addCount()
        achievement.addCount()
        achievement.addCount()
        XCTAssertEqual(5, achievement.currentCount)
        XCTAssertTrue(achievement.earned)
        
        UserDefaults().removeObject(forKey: UserDefaultKeys.easyFive)
    }
    
    func testCompareAchievements() {
        let achievement1 = UserAchievements.getInstance().EASY_FIVE
        let achievement2 = UserAchievements.getInstance().EASY_FIFTEEN
        
        XCTAssertTrue(achievement1 < achievement2)
        
        let achivement3 = UserAchievements.getInstance().MEDIUM_THREE
        XCTAssertTrue(achivement3 < achievement1)
        
        achievement1.addCount()
        achievement1.addCount()
        
        XCTAssertEqual(achievement1, achivement3)
        XCTAssertTrue(achievement1 < achivement3)
        
        UserDefaults().removeObject(forKey: UserDefaultKeys.easyFive)
    }
}
