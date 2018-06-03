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
}

struct UserDefaultKeys {
    
    static let level = "difficultyLevel"
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
    
    
    var puzzleSize: Int {
        get {
            switch(self.level) {
            case DifficultyLevel.EASY:
                return Int(30 + arc4random_uniform(6))
            case DifficultyLevel.MEDIUM:
                return Int(24 + arc4random_uniform(6))
            case DifficultyLevel.HARD:
                return Int(19 + arc4random_uniform(5))
            default:
                return 25
            }
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
