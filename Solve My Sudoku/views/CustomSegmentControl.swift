//
//  CustomSegmentControl.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/2/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class CustomSegmentControl: UISegmentedControl {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tintColor = UIColor.black
    }
    
    
}
