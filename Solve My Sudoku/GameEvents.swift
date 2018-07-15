//
//  GameEvents.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/21/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation

/// Game events
protocol GameEventsDelegate {
    
    /// Puzzle solved
    func puzzleSolved(cluesTaken:Int, timeTaken: Int, timesChecked: Int)
}

class GameEvents: GameEventsDelegate {
    
    var ua: UserAchievements = UserAchievements.getInstance()
    
    func puzzleSolved(cluesTaken: Int, timeTaken: Int, timesChecked: Int) {
        DispatchQueue.global().async {
            if Settings.getInstance().level == .EASY {
                self.ua.EASY_FIVE.addCount()
                self.ua.EASY_FIFTEEN.addCount()
                self.ua.EASY_TWENTYFIVE.addCount()
                self.ua.EASY_TIME_SEVEN.check(newValue: timeTaken)
                self.ua.EASY_TIME_FIVE.check(newValue: timeTaken)
            } else if Settings.getInstance().level == .MEDIUM {
                self.ua.MEDIUM_THREE.addCount()
                self.ua.MEDIUM_TEN.addCount()
                self.ua.MEDIUM_TWENTY.addCount()
                self.ua.MEDIUM_TIME_TEN.check(newValue: timeTaken)
                self.ua.MEDIUM_TIME_SEVEN.check(newValue: timeTaken)
            } else if Settings.getInstance().level == .HARD {
                self.ua.HARD_TWO.addCount()
                self.ua.HARD_SEVEN.addCount()
                self.ua.HARD_FIFTEEN.addCount()
                self.ua.HARD_TIME_FIFTEEN.check(newValue: timeTaken)
                self.ua.HARD_TIME_TEN.check(newValue: timeTaken)
            }
        }
    }
    
   
}
