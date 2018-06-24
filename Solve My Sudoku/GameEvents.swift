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
    
    var achievements: UserAchievements = UserAchievements.getInstance()
    
    func puzzleSolved(cluesTaken: Int, timeTaken: Int, timesChecked: Int) {
        DispatchQueue.global().async {
            if cluesTaken == 0 {
                
            }
        }
    }
    
   
}
