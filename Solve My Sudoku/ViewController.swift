//
//  ViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 3/19/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var embeddedView: UIView!
    let shapeLayer = CAShapeLayer()
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var adsBannerView: GADBannerView!
    
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
    
    @IBOutlet weak var solveButton: UIButton!
    
    var sudokuBoard:[[SudoKoCellView]] = []
    
    @IBAction func calculate(_ sender: Any) {
        self.view.endEditing(false)
        
        // Input Validation
        if self.userInputCellCount() < 17 {
            let alert = UIAlertController(title: "Invalid Input", message: "Need atleast 17 digits to solve the puzzle", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: { _ in }) )
            self.present(alert, animated: true, completion: nil)
            return
        }
        let solverService: SolverService = SolverService(userInput: self.sudokuBoard)
        let duplicates = solverService.checkForDuplicates()
        if (duplicates.count > 0) {
            self.highlightCells(cells: duplicates)
            let alert = UIAlertController(title: "Invalid Input", message: "Duplicate numbers", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Fix", style: UIAlertActionStyle.default, handler: { _ in }) )
            self.present(alert, animated: true, completion: nil)
            return
        }
    
        self.greyOutEmptyCells()
        self.solveButton.isEnabled = false
        self.clearButton.isEnabled = false
        solverService.solve {
            self.solveButton.isEnabled = true
            self.clearButton.isEnabled = true
        }
    }
    
    @IBAction func clearInput(_ sender: Any) {
        for row in self.sudokuBoard {
            for cell in row {
                cell.reset()
            }
        }
    }
    
    
    /// - Returns: The number of cells that have user input
    func userInputCellCount() -> Int {
        return self.sudokuBoard.joined().filter {$0.hasText}.count
    }
    
    func greyOutEmptyCells() {
        self.sudokuBoard.joined().forEach( {(cell:SudoKoCellView) -> Void in
            if cell.integerValue == 0 {
                cell.setAsEmptyCell(true)
            } else {
                cell.setAsEmptyCell(false)
            }
        })
    }
    
    func highlightCells(cells:[(Int,Int)]) {
        for cell in cells {
            self.sudokuBoard[cell.0][cell.1].highlight()
        }
    }
    
    func convertTo2DIntegerArray(sudokuBoard:[[SudoKoCellView]]) -> [[Int]] {
        var integerArray: [[Int]] = [[]]
        var rowNumber = 0
        for row in sudokuBoard {
            var columnNumber = 0
            for column in row {
                integerArray[rowNumber][columnNumber] = column.integerValue
                columnNumber = columnNumber + 1
            }
            rowNumber = rowNumber + 1
        }
        return integerArray
    }
    
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
        
        let x = UIColor(red: 152.0/255.0, green: 218.0/255.0, blue: 252.0/255.0, alpha: 82.0)
        UIApplication.shared.statusBarView?.backgroundColor = x
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        adsBannerView.delegate = self
        adsBannerView.adUnitID = "ca-app-pub-1253615041445374/7750305855"
        adsBannerView.rootViewController = self
        adsBannerView.load(request)
    }
    
    
    /// Had to add the bezier path code here since
    /// it needs to resize for different screen sizes.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let squarePath = UIBezierPath(rect: self.stack.bounds)
        let width = self.stack.bounds.width
        let height = self.stack.bounds.height
        
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
        shapeLayer.lineWidth = 1.5
        self.shapeLayer.frame = self.stack.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var shouldAutorotate: Bool {
        get{
            return true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get{
            return UIInterfaceOrientationMask.portrait
        }
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}




