//
//  HelpViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/12/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var embeddedView: UIView!
    
    @IBAction func exit(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        self.embeddedView.layer.cornerRadius = 10.0
        
    }
}
