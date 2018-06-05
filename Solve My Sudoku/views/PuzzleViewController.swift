//
//  PuzzleViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/23/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PuzzleViewController: SuperViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var clueButton: UIButton!
    @IBOutlet weak var adBanner: GADBannerView!
    @IBOutlet weak var navigationItemx: UINavigationItem!
    
    @IBOutlet weak var a0: SudoKoCellView!
    @IBOutlet weak var a1: SudoKoCellView!
    @IBOutlet weak var a2: SudoKoCellView!
    @IBOutlet weak var a3: SudoKoCellView!
    @IBOutlet weak var a4: SudoKoCellView!
    @IBOutlet weak var a5: SudoKoCellView!
    @IBOutlet weak var a6: SudoKoCellView!
    @IBOutlet weak var a7: SudoKoCellView!
    @IBOutlet weak var a8: SudoKoCellView!
    
    @IBOutlet weak var b0: SudoKoCellView!
    @IBOutlet weak var b1: SudoKoCellView!
    @IBOutlet weak var b2: SudoKoCellView!
    @IBOutlet weak var b3: SudoKoCellView!
    @IBOutlet weak var b4: SudoKoCellView!
    @IBOutlet weak var b5: SudoKoCellView!
    @IBOutlet weak var b6: SudoKoCellView!
    @IBOutlet weak var b7: SudoKoCellView!
    @IBOutlet weak var b8: SudoKoCellView!
    
    @IBOutlet weak var c0: SudoKoCellView!
    @IBOutlet weak var c1: SudoKoCellView!
    @IBOutlet weak var c2: SudoKoCellView!
    @IBOutlet weak var c3: SudoKoCellView!
    @IBOutlet weak var c4: SudoKoCellView!
    @IBOutlet weak var c5: SudoKoCellView!
    @IBOutlet weak var c6: SudoKoCellView!
    @IBOutlet weak var c7: SudoKoCellView!
    @IBOutlet weak var c8: SudoKoCellView!
    
    @IBOutlet weak var d0: SudoKoCellView!
    @IBOutlet weak var d1: SudoKoCellView!
    @IBOutlet weak var d2: SudoKoCellView!
    @IBOutlet weak var d3: SudoKoCellView!
    @IBOutlet weak var d4: SudoKoCellView!
    @IBOutlet weak var d5: SudoKoCellView!
    @IBOutlet weak var d6: SudoKoCellView!
    @IBOutlet weak var d7: SudoKoCellView!
    @IBOutlet weak var d8: SudoKoCellView!
    
    @IBOutlet weak var e0: SudoKoCellView!
    @IBOutlet weak var e1: SudoKoCellView!
    @IBOutlet weak var e2: SudoKoCellView!
    @IBOutlet weak var e3: SudoKoCellView!
    @IBOutlet weak var e4: SudoKoCellView!
    @IBOutlet weak var e5: SudoKoCellView!
    @IBOutlet weak var e6: SudoKoCellView!
    @IBOutlet weak var e7: SudoKoCellView!
    @IBOutlet weak var e8: SudoKoCellView!
    
    @IBOutlet weak var f0: SudoKoCellView!
    @IBOutlet weak var f1: SudoKoCellView!
    @IBOutlet weak var f2: SudoKoCellView!
    @IBOutlet weak var f3: SudoKoCellView!
    @IBOutlet weak var f4: SudoKoCellView!
    @IBOutlet weak var f5: SudoKoCellView!
    @IBOutlet weak var f6: SudoKoCellView!
    @IBOutlet weak var f7: SudoKoCellView!
    @IBOutlet weak var f8: SudoKoCellView!
    
    @IBOutlet weak var g0: SudoKoCellView!
    @IBOutlet weak var g1: SudoKoCellView!
    @IBOutlet weak var g2: SudoKoCellView!
    @IBOutlet weak var g3: SudoKoCellView!
    @IBOutlet weak var g4: SudoKoCellView!
    @IBOutlet weak var g5: SudoKoCellView!
    @IBOutlet weak var g6: SudoKoCellView!
    @IBOutlet weak var g7: SudoKoCellView!
    @IBOutlet weak var g8: SudoKoCellView!
    
    @IBOutlet weak var h0: SudoKoCellView!
    @IBOutlet weak var h1: SudoKoCellView!
    @IBOutlet weak var h2: SudoKoCellView!
    @IBOutlet weak var h3: SudoKoCellView!
    @IBOutlet weak var h4: SudoKoCellView!
    @IBOutlet weak var h5: SudoKoCellView!
    @IBOutlet weak var h6: SudoKoCellView!
    @IBOutlet weak var h7: SudoKoCellView!
    @IBOutlet weak var h8: SudoKoCellView!
    
    @IBOutlet weak var i0: SudoKoCellView!
    @IBOutlet weak var i1: SudoKoCellView!
    @IBOutlet weak var i2: SudoKoCellView!
    @IBOutlet weak var i3: SudoKoCellView!
    @IBOutlet weak var i4: SudoKoCellView!
    @IBOutlet weak var i5: SudoKoCellView!
    @IBOutlet weak var i6: SudoKoCellView!
    @IBOutlet weak var i7: SudoKoCellView!
    @IBOutlet weak var i8: SudoKoCellView!
   
    let shapeLayer = CAShapeLayer()
    var puzzle: Puzzle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stack.layer.addSublayer(shapeLayer)
        
        self.sudokuBoard = [[a0,a1,a2,a3,a4,a5,a6,a7,a8],
                            [b0,b1,b2,b3,b4,b5,b6,b7,b8],
                            [c0,c1,c2,c3,c4,c5,c6,c7,c8],
                            [d0,d1,d2,d3,d4,d5,d6,d7,d8],
                            [e0,e1,e2,e3,e4,e5,e6,e7,e8],
                            [f0,f1,f2,f3,f4,f5,f6,f7,f8],
                            [g0,g1,g2,g3,g4,g5,g6,g7,g8],
                            [h0,h1,h2,h3,h4,h5,h6,h7,h8],
                            [i0,i1,i2,i3,i4,i5,i6,i7,i8]]
        
        puzzle = Puzzle(sudokuBoard: self.sudokuBoard)
        puzzle.new()
        
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        adBanner.delegate = self
        adBanner.adUnitID = Configuration.bannerAdUnit
        adBanner.rootViewController = self
        adBanner.load(request)
    }
    
    // clear out everything except the puzzle
    @IBAction func clear(_ sender: Any) {
        for i in self.sudokuBoard.joined() {
            if i.type != .PUZZLE {
                i.reset()
                i.type = .ANSWER
            }
        }
    }
    
    @IBAction func newGame(_ sender: Any) {
        self.sudokuBoard.joined().forEach { cell in
            cell.reset()
        }
        self.viewDidLoad()
    }
    
    @IBAction func getClue(_ sender: Any) {
        let cells = puzzle.getEmptyCells()
        if cells.count > 0 {
            let randomIndex = arc4random_uniform(UInt32((cells.count)))
            let cell = cells[Int(randomIndex)]
            self.puzzle.updateThisResult(row: cell.0, column: cell.1, as: .CLUE)
        }
        showInterstitialAd()
    }
    
    @IBAction func check(_ sender: Any) {
        var incorrectAnswers:[(Int,Int)] = []
        let emptyCells = self.puzzle.getEmptyCells()
        var rowCount = 0
        for row in sudokuBoard {
            var columnCount = 0
            for column in row {
                if (((column.type == .ANSWER) || (column.type == .ERROR)) && column.hasTextInput) {
                    if !(column.integerValue == puzzle.solvedPuzzle[rowCount][columnCount]) {
                        incorrectAnswers.append((rowCount,columnCount))
                    }
                }
                columnCount += 1
            }
            rowCount += 1
        }
        
        if incorrectAnswers.count > 0 {
            showInterstitialAd()
            for inc in incorrectAnswers {
                self.sudokuBoard[inc.0][inc.1].type = .ERROR
            }
            self.showAlert(title: "Oops", message: "Something's not right", actionMessage: "Try Again")
            return
        }
        
        if emptyCells.count == 0 {
            self.showAlert(title: "CONGRATULATIONS!!", message: "You've solved the puzzle", actionMessage: "Done")
            return
        } else {
            showInterstitialAd()
            self.showAlert(title: "Good so far", message: "Complete the rest of the puzzle", actionMessage: "Done")
            return
        }
        
    }
    
    @IBAction func settings(_ sender: Any) {
        let popUpVc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "settings") as! SettingsViewController
        self.addChildViewController(popUpVc)
        popUpVc.view.frame = self.view.frame
        self.view.addSubview(popUpVc.view)
        popUpVc.didMove(toParentViewController: self)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let squarePath = UIBezierPath(rect: self.stack.bounds)
        let width = self.stack.bounds.width
        let height = self.stack.bounds.height
        
        self.clueButton.titleLabel?.font = UIFont(name: TextFont.hintButton, size: clueButton.bounds.height)
        self.clueButton.setTitleColor(TextColors.clues, for: UIControlState.normal)
        
        let firstVerticalCoord = width/3
        squarePath.move(to: CGPoint(x:firstVerticalCoord, y:0))
        squarePath.addLine(to: CGPoint(x:firstVerticalCoord, y:height))
        
        let secondVerticalCoord = (width * 2)/3
        squarePath.move(to: CGPoint(x:secondVerticalCoord, y:0))
        squarePath.addLine(to: CGPoint(x:secondVerticalCoord, y:height))
        
        let firstHorizontal = height/3
        squarePath.move(to: CGPoint(x:0, y:firstHorizontal))
        squarePath.addLine(to: CGPoint(x:width, y:firstHorizontal))
        
        let secondHorizontal = (height * 2)/3
        squarePath.move(to: CGPoint(x:0, y:secondHorizontal))
        squarePath.addLine(to: CGPoint(x:width, y:secondHorizontal))
        
        shapeLayer.path = squarePath.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.8
        self.shapeLayer.frame = self.stack.bounds
        
        self.sudokuBoard.joined().forEach { cell in
            cell.adjustFont()
        }
    }
}
