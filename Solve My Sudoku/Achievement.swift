//
//  Achievements.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/17/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit
import Firebase

protocol Achievement {
    
    /// what is the achievement worth
    var stars: Int {get}
    
    /// what is this achievement
    var description: String {get}
    
    /// has the user already earned this achievement
    var earned: Bool{set get} 
    
    /// The key name used to store the achievements
    var userDefaultKey: String {get}
    
    /// The current level of the achievement
    var currentLevel: String {get}
}

class CountBasedAchievement: Achievement,Equatable {
    
    let stars: Int
    
    let description: String
    
    var earned: Bool = false 
    
    let limit: Int
    
    private(set) var currentCount: Int = 0
    
    let userDefaultKey: String
    
    var currentLevel: String {
        get {
            if self.earned {
                return ""
            }
            return "\(self.currentCount) of \(self.limit)"
        }
    }
    
    init(stars:Int, description: String, initialCount: Int, limit: Int, userDefaultKey: String) {
        self.stars = stars
        self.limit = limit
        self.description = description
        self.userDefaultKey = userDefaultKey
        self.currentCount = UserDefaults().integer(forKey: self.userDefaultKey)
        if (self.currentCount >= self.limit) {
            self.earned = true
        }
    }
    
    /// Increment the count (User's progression towards the achievement)
    ///
    /// - Parameter count: Integer
    func addCount(count:Int = 1) {
        if earned {
            return
        }
        currentCount += 1
        UserDefaults().set(currentCount, forKey: self.userDefaultKey)
        if currentCount >= limit {
            self.earned = true
            Analytics.logEvent(Events.ACHIEVEMENT_UNLOCKED, parameters: ["description":self.description])
        }
    }
    
    static func == (lhs: CountBasedAchievement, rhs: CountBasedAchievement) -> Bool {
        if (lhs.stars == rhs.stars) && ((lhs.limit - lhs.currentCount) == (rhs.limit - rhs.currentCount)) {
            return true
        }
        return false
    }

    static func < (lhs: CountBasedAchievement, rhs: CountBasedAchievement) -> Bool {
        if (lhs.stars < rhs.stars) {
            return true
        } else if (lhs.stars == rhs.stars) {
            if lhs.limit - lhs.currentCount <= rhs.limit - rhs.currentCount {
                return true
            }
        }
        return false
    }
}

/// Lack of a better word for it
/// this is mainly to track achievements that do not need to maintain state.
/// Just compares the values to the limit
class OneTimeAchievement: Achievement {
    
    let stars: Int
    
    let description: String
    
    var earned: Bool = false 
    
    let userDefaultKey: String
    
    var currentValue: Int
    
    let limit:Int
    
    var currentLevel: String {
        get {
            if self.earned {
                return ""
            }
            return "Best: \(self.currentValue)" 
        }
    }

    init(stars:Int, description: String, limit: Int, userDefaultKey: String) {
        
        self.stars = stars
        self.description = description
        self.userDefaultKey = userDefaultKey
        self.currentValue = UserDefaults().integer(forKey: self.userDefaultKey)
        self.limit = limit
        self.check(newValue: self.currentValue)
    }
    
    func check(newValue: Int){
        if earned {
            return
        }
        if (newValue <= self.currentValue) {
            self.currentValue = newValue
            UserDefaults().set(self.currentValue, forKey: self.userDefaultKey)
        }
        if (newValue < self.limit && (newValue  != 0)) {
            self.earned = true
            Analytics.logEvent(Events.ACHIEVEMENT_UNLOCKED, parameters: ["description":self.description])
        }
    }
}


class TimeBasedAchievement: OneTimeAchievement {
    
    override var currentLevel: String {
        if self.earned {
            return ""
        }
        return "Best: " + Utils.dateString(forInterval: self.currentValue)
    }
}

extension Achievement {
    
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        if (lhs.stars == rhs.stars) {
            return true
        }
        return false
    }
    
    static func < (lhs: Achievement, rhs: Achievement) -> Bool {
        if !lhs.earned && rhs.earned {
            return true
        }
        if (!lhs.earned && !rhs.earned) || (lhs.earned && rhs.earned) {
            if (lhs.stars <= rhs.stars) {
                return true
            }
            }
        return false
    }
}
