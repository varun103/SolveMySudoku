//
//  UserAchievements.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/20/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation


class UserAchievements {
    
    private static var instance: UserAchievements = UserAchievements()
    
    var EASY_FIVE = CountBasedAchievement(stars: 1, description: "", initialCount: 0, limit: 5, userDefaultKey: UserDefaultKeys.easyFive)
    var EASY_FIFTEEN = CountBasedAchievement(stars: 2, description: "", initialCount: 0, limit: 15, userDefaultKey: UserDefaultKeys.easyFifteen)
    var EASY_TWENTYFIVE = CountBasedAchievement(stars: 3, description: "", initialCount: 0, limit: 25, userDefaultKey: UserDefaultKeys.easyTwentyFive)
    
    var MEDIUM_THREE = CountBasedAchievement(stars: 1, description:"", initialCount: 0, limit: 3, userDefaultKey: UserDefaultKeys.mediumThree)
    var MEDIUM_TEN = CountBasedAchievement(stars: 2, description:"", initialCount: 0, limit: 10, userDefaultKey: UserDefaultKeys.mediumTen)
    var MEDIUM_TWENTY = CountBasedAchievement(stars: 3, description:"", initialCount: 0, limit: 20, userDefaultKey: UserDefaultKeys.mediumTwenty)

    var HARD_TWO = CountBasedAchievement(stars: 3, description:"", initialCount: 0, limit: 5, userDefaultKey: UserDefaultKeys.hardTwo)
    var HARD_SEVEN = CountBasedAchievement(stars: 5, description: "", initialCount: 0, limit: 10, userDefaultKey: UserDefaultKeys.hardSeven)
    var HARD_FIFTEEN = CountBasedAchievement(stars: 5, description: "", initialCount: 0, limit: 10, userDefaultKey: UserDefaultKeys.hardFifteen)

    static func getInstance() -> UserAchievements{
        return instance
    }
    
    
    
    private init() {
    }
}
