//
//  Metrics.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/18/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation

struct CountMetric {
    let name:String
    var count: Int
    
    mutating func increment(by addition: Int) {
        self.count = self.count + addition
    }
}


struct Metrics {
    static var EASY_SOLVED = CountMetric(name: "easy_solved", count: 0)
    static var MEDIUM_SOLVED = CountMetric(name: "medium_solved", count: 0)
    static var HARD_SOLVED = CountMetric(name: "hard_solved", count: 0)
}

