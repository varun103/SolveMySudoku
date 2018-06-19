//
//  Achievements.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/17/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

protocol Achievement {
    
    /// what is the achievement worth
    var stars: Int {get}
    
    /// what is this achievement
    var description: String {get}
    
    /// has the user already earned this achievement
    var earned: Bool{set get}
    
}


class CountBasedAchievement: Achievement {
    
    var stars: Int
    
    var description: String
    
    var earned: Bool
    
    init(stars:Int, description: String, initialCount: Int) {
        self.stars = stars
        self.description = description
        self.earned = false
    }
}
