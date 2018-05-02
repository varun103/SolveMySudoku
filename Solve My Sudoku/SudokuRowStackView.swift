//
//  SudokuRowStackView.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 4/29/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

/// Stack view specification for a sudoKu row 
class SudokuRowStackView: UIStackView {

    required init(coder:NSCoder) {
        super.init(coder: coder)
        self.axis = UILayoutConstraintAxis.horizontal
        self.alignment = UIStackViewAlignment.fill
        self.distribution = UIStackViewDistribution.fill
        self.spacing = 10.0
    }
}
