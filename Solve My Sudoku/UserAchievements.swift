//
//  UserAchievements.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/20/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation

///
struct AchievementDescription {
    
    static let easyFive = "Solve 5 easy puzzles"
    static let easyFifteen = "Solve 15 easy puzzles"
    static let easyTwentyFive = "Solve 25 easy puzzles"
    
    static let mediumThree = "Solve 3 medium puzzles"
    static let mediumTen = "Solve 10 medium puzzles"
    static let mediumTwenty = "Solve 20 medium puzzles"
    
    static let hardTwo = "Solve 2 hard puzzles"
    static let hardSeven = "Solve 7 hard puzzles"
    static let hardFifteen = "Solve 15 hard puzzles"
    
    static let easyTime = "Solve an easy puzzle in 7 minutes"
    static let mediumTime = "Solve a medium puzzle in 10 minutes"
    static let hardTime = "Solve a hard puzzle in 15 minutes"
    
    static let easyTimeTwo = "Solve an easy puzzle in 5 minutes"
    static let mediumTimeTwo = "Solve a medium puzzle in 7 minutes"
    static let hardTimeTwo = "Solve a hard puzzle in 10 minutes"
    
    static let easyNoClue = "Solve an easy puzzle without any clues"
    static let mediumNoClue = "Solve an easy puzzle without any clues"
    static let hardNoClue = "Solve an easy puzzle without any clues"
}

class UserAchievements {
    
    private static var instance: UserAchievements = UserAchievements()
    
    var all:[Achievement]
    
    var unearned:[Achievement] {
        return self.all.filter{!$0.earned}
    }
    
    var earnedAchievements:[Achievement] {
        return self.all.filter{$0.earned}
    }
    
    var total: Int {
        return self.earnedAchievements.map{$0.stars}.reduce(0, +)
    }
    
    var EASY_FIVE = CountBasedAchievement(stars: 1, description: AchievementDescription.easyFive, initialCount: 0, limit: 5, userDefaultKey: UserDefaultKeys.easyFive)
    var EASY_FIFTEEN = CountBasedAchievement(stars: 2, description: AchievementDescription.easyFifteen, initialCount: 0, limit: 15, userDefaultKey: UserDefaultKeys.easyFifteen)
    var EASY_TWENTYFIVE = CountBasedAchievement(stars: 3, description: AchievementDescription.easyTwentyFive, initialCount: 0, limit: 25, userDefaultKey: UserDefaultKeys.easyTwentyFive)
    
    var MEDIUM_THREE = CountBasedAchievement(stars: 1, description:AchievementDescription.mediumThree, initialCount: 0, limit: 3, userDefaultKey: UserDefaultKeys.mediumThree)
    var MEDIUM_TEN = CountBasedAchievement(stars: 2, description:AchievementDescription.mediumTen, initialCount: 0, limit: 10, userDefaultKey: UserDefaultKeys.mediumTen)
    var MEDIUM_TWENTY = CountBasedAchievement(stars: 3, description:AchievementDescription.mediumTwenty, initialCount: 0, limit: 20, userDefaultKey: UserDefaultKeys.mediumTwenty)
    
    var HARD_TWO = CountBasedAchievement(stars: 1, description:AchievementDescription.hardTwo, initialCount: 0, limit: 2, userDefaultKey: UserDefaultKeys.hardTwo)
    var HARD_SEVEN = CountBasedAchievement(stars: 2, description: AchievementDescription.hardSeven, initialCount: 0, limit: 7, userDefaultKey: UserDefaultKeys.hardSeven)
    var HARD_FIFTEEN = CountBasedAchievement(stars: 3, description: AchievementDescription.hardFifteen, initialCount: 0, limit: 15, userDefaultKey: UserDefaultKeys.hardFifteen)
    
    var EASY_TIME_SEVEN = TimeBasedAchievement(stars:1, description: AchievementDescription.easyTime , limit: 420, userDefaultKey:UserDefaultKeys.bestTimeEasy)
    var MEDIUM_TIME_TEN = TimeBasedAchievement(stars:1, description:AchievementDescription.mediumTime, limit: 600, userDefaultKey:UserDefaultKeys.bestTimeMedium)
    var HARD_TIME_FIFTEEN = TimeBasedAchievement(stars:1, description:AchievementDescription.hardTime, limit: 900, userDefaultKey:UserDefaultKeys.bestTimeHard)
    
    var EASY_TIME_FIVE = TimeBasedAchievement(stars:2, description: AchievementDescription.easyTimeTwo , limit: 300, userDefaultKey:UserDefaultKeys.bestTimeEasy)
    var MEDIUM_TIME_SEVEN = TimeBasedAchievement(stars:2, description:AchievementDescription.mediumTimeTwo, limit: 420, userDefaultKey:UserDefaultKeys.bestTimeMedium)
    
    
    var HARD_TIME_TEN = TimeBasedAchievement(stars:3, description:AchievementDescription.hardTimeTwo, limit: 600, userDefaultKey:UserDefaultKeys.bestTimeHard)
    
    static func getInstance() -> UserAchievements{
        return instance
    }
    
    private init() {
        
        // When you update this - update gameEvents too
        // to ensure that the achievement is checked for
        
        all = [EASY_FIVE,
               EASY_FIFTEEN,
               EASY_TWENTYFIVE,
               
               MEDIUM_THREE,
               MEDIUM_TEN,
               MEDIUM_TWENTY,
               
               HARD_TWO,
               HARD_SEVEN,
               HARD_FIFTEEN,
               
               EASY_TIME_SEVEN,
               MEDIUM_TIME_TEN,
               HARD_TIME_FIFTEEN,
        
               EASY_TIME_FIVE,
               MEDIUM_TIME_SEVEN,
               HARD_TIME_TEN ]
    }
}



