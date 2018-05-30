//
//  Configuration.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/24/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import Foundation


struct Configuration {
    
    static let bannerAdUnit = "ca-app-pub-1253615041445374/7750305855"
    static let interstitialAdUnit = "ca-app-pub-1253615041445374/7279675752"
}

struct PuzzleInput {
    static var easy = 27 + arc4random_uniform(8)
    static let minInput = 17
}
