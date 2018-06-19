//
//  Settings.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/2/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation

enum DifficultyLevel: String {
    case EASY = "easy"
    case MEDIUM = "medium"
    case HARD = "hard"
    case DAMN = "damn"
    
    /// puzzle size - since its associate with the level
    ///
    /// - Returns: <#return value description#>
    func size() -> Int {
        switch self {
        case .EASY:
            return Int(30 + arc4random_uniform(6))
        case .MEDIUM:
            return Int(24 + arc4random_uniform(6))
        case .HARD:
            return Int(19 + arc4random_uniform(5))
        default:
            return 25
        }
    }
    
    /// The time penalty to add for a clue or in case of errors
    func timePenalty() -> Int {
        switch self {
        case .EASY:
            return 60
        case .MEDIUM:
            return 90
        case .HARD:
            return 120
        default:
            return 60
        }
    }
    
    func bestTimeKey() -> String {
        switch self {
        case .EASY:
            return UserDefaultKeys.bestTimeEasy
        case .MEDIUM:
            return UserDefaultKeys.bestTimeMedium
        case .HARD:
            return UserDefaultKeys.bestTimeHard
        default:
            return UserDefaultKeys.bestTimeEasy
        }
    }
}

struct UserDefaultKeys {
    static let level = "difficultyLevel"
    static let bestTimeEasy = "timeEasy"
    static let bestTimeMedium = "timeMedium"
    static let bestTimeHard = "timeHard"
    static let puzzlesPlayed = "count"
}

/// Singleton class - only one instance per application
class Settings {
    
    private var userDefaults: UserDefaults
    
    private static var INSTANCE: Settings = Settings()
    
    static func getInstance() -> Settings {
        return INSTANCE
    }
    
    var level: DifficultyLevel = DifficultyLevel.EASY {
        didSet {
            self.userDefaults.set(level.rawValue, forKey: UserDefaultKeys.level)
        }
    }
    
    var bestTime:Int {
        set (time) {
            self.userDefaults.set(time, forKey: self.level.bestTimeKey())
        }
        get {
            return self.userDefaults.integer(forKey: self.level.bestTimeKey())
        }
    }
    
    var puzzleSize: Int {
        get {
            return self.level.size()
        }
    }
    
    var timePenalty: Int {
        get {
            return self.level.timePenalty()
        }
    }
    
    private init() {
        self.userDefaults = UserDefaults()
        if let defaultLevel = self.userDefaults.string(forKey: UserDefaultKeys.level) {
            if let savedLevel = DifficultyLevel(rawValue: defaultLevel) {
                self.level = savedLevel
            }
        }
    }
}
