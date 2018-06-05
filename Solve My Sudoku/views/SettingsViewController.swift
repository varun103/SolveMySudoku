//
//  SettingsViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/31/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settings:Settings = Settings.getInstance()
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var settingWindow: UIView!
    @IBOutlet weak var levelControl: CustomSegmentControl!
    
    override func viewDidLoad() {
        settingWindow.layer.cornerRadius = 15.0
        saveButton.layer.cornerRadius = 15.0
        
        switch(settings.level) {
        case .EASY:
            self.levelControl.selectedSegmentIndex = 0
        case .MEDIUM:
            self.levelControl.selectedSegmentIndex = 1
        case .HARD:
            self.levelControl.selectedSegmentIndex = 2
        default:
            self.levelControl.selectedSegmentIndex = 0
        }
    }
    
    
    @IBAction func saveSettings(_ sender: Any) {
        let index = levelControl.selectedSegmentIndex
        var newLevel: DifficultyLevel
        var newPuzzle = true
        
        switch(index) {
        case 0:
            newLevel = .EASY
        case 1:
            newLevel = .MEDIUM
        case 2:
            newLevel = .HARD
        default:
            newLevel = .EASY
        }
        
        if newLevel == settings.level {
            newPuzzle = false
        }
        settings.level = newLevel
        self.saveButton.isEnabled = false
        
        // segue creates a new VC everytime which creates a new puzzle
        if newPuzzle {
            performSegue(withIdentifier: "puzzle", sender: self)
        } else {
            self.view.removeFromSuperview()
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "puzzle" {
            let _: CustomTabViewController = segue.destination as! CustomTabViewController
        }
    }
    
    
}
