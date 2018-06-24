//
//  PuzzleViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/23/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Firebase

class PuzzleViewController: SuperViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var stack: UIStackView!
    
    //Buttons
    @IBOutlet weak var clueButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var adBanner: GADBannerView!
    @IBOutlet weak var navigationItemx: UINavigationItem!

    //Labels
    @IBOutlet weak var bestTimeLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    //Cells
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
    var timer: Timer!
    var gameEventsDelegate:GameEventsDelegate = GameEvents()
    
    // Metrics
    var timeElapsed:Int = 0
    var clueCount:Int = 0
    var countChecks:Int = 0
    var puzzleSolved: Bool!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stack.layer.addSublayer(shapeLayer)
        self.enableInput()
        
        self.sudokuBoard = [[a0,a1,a2,a3,a4,a5,a6,a7,a8],
                            [b0,b1,b2,b3,b4,b5,b6,b7,b8],
                            [c0,c1,c2,c3,c4,c5,c6,c7,c8],
                            [d0,d1,d2,d3,d4,d5,d6,d7,d8],
                            [e0,e1,e2,e3,e4,e5,e6,e7,e8],
                            [f0,f1,f2,f3,f4,f5,f6,f7,f8],
                            [g0,g1,g2,g3,g4,g5,g6,g7,g8],
                            [h0,h1,h2,h3,h4,h5,h6,h7,h8],
                            [i0,i1,i2,i3,i4,i5,i6,i7,i8]]
        
        self.timeElapsed = 0
        self.clueCount = 0
        self.countChecks = 0
        
        self.puzzleSolved = false
        self.timerLabel.text = Utils.dateString(forInterval: self.timeElapsed)
        self.bestTimeLabel.text = "Best: " + Utils.dateString(forInterval: Settings.getInstance().bestTime)
        puzzle = Puzzle(sudokuBoard: self.sudokuBoard)
        puzzle.new()
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        adBanner.delegate = self
        adBanner.adUnitID = Configuration.bannerAdUnit
        adBanner.rootViewController = self
        adBanner.load(request)
        
        self.notificationLabel.text = ""
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.checkIfPuzzleSolved) , name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    
    @IBAction func clear(_ sender: Any) {
        clearPuzzle()
    }
    
    @IBAction func newGame(_ sender: Any) {
        startNewGame()
    }
    
    @IBAction func getClue(_ sender: Any) {
        clue()
    }
    
    @IBAction func check(_ sender: Any) {
        return check()
    }
    
    @objc func checkIfPuzzleSolved(){
        if self.puzzle.getEmptyCells().count == 0 {
            self.check(self)
        }
    }
    
    // clear out everything except the puzzle
    fileprivate func clearPuzzle() {
        if (self.puzzleSolved) {
            return
        }
        for i in self.sudokuBoard.joined() {
            if i.type != .PUZZLE {
                i.reset()
                i.type = .ANSWER
            }
        }
    }
    fileprivate func startNewGame() {
        Analytics.logEvent(Events.NEW_PUZZLE, parameters: nil)
        self.sudokuBoard.joined().forEach { cell in
            cell.reset()
        }
        NotificationCenter.default.removeObserver(self)
        self.viewDidLoad()
    }
    
    fileprivate func clue() {
        if self.puzzleSolved {
            return
        }
        // log event
        Analytics.logEvent(Events.PUZZLE_CLUE, parameters: nil)
        
        // Add clue count
        self.clueCount += 1
        let cells = puzzle.getEmptyCells()
        if cells.count > 0 {
            let randomIndex = arc4random_uniform(UInt32((cells.count)))
            let cell = cells[Int(randomIndex)]
            self.puzzle.updateThisResult(row: cell.0, column: cell.1, as: .CLUE)
            self.addTimePenalty()
        }
        showInterstitialAd()
        checkIfPuzzleSolved()
    }

    
    /// animation method done when the puzzle is solved
    ///
    /// - Parameters:
    ///   - index: given for the recursion call
    ///   - completion: block to run after the animation has completed
    private func puzzleSolvedAnimation(index:(Int,Int), completion: @escaping () -> Void) {
        if index.0 == 9 && index.1 == 0 {
            completion()
            return
        }
        let cell = self.sudokuBoard[index.0][index.1]
        
        var newIndex0 = index.0
        var newIndex1 = index.1
        if (index.1 == 8) {
            newIndex0 = index.0 + 1
            newIndex1 = 0
        } else {
            newIndex1 = index.1 + 1
        }
        UIView.animate(withDuration: 0.04, delay: 0, options: .curveEaseInOut, animations: {
            cell.textColor = TextColors.correct
            cell.layer.backgroundColor = BackgroundColors.correctCell.cgColor
        }) { bool in
            if (bool) {
                cell.layer.backgroundColor = UIColor.clear.cgColor
                self.puzzleSolvedAnimation(index: (newIndex0, newIndex1), completion: {
                    completion()
                })
            }
        }
    }
    
    private func checkAnimation(cellIndices:[(Int,Int)], correct: Bool) {
        for cellIndex in cellIndices {
            let cell = self.sudokuBoard[cellIndex.0][cellIndex.1]
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
                if correct {
                    cell.backgroundColor = BackgroundColors.correctCell
                    cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                } else {
                    cell.backgroundColor = BackgroundColors.highlightCell
                    cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }
            }) { (bool) in
                cell.backgroundColor = UIColor.clear
                cell.transform = .identity
            }
        }
    }
    
    private func checkAnimationNoInput(cellIndices:[(Int,Int)]) {
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
            self.notificationLabel.text = "No input to check"
            self.notificationLabel.alpha = 0.8
            self.notificationLabel.textColor = TextColors.notifications
            self.notificationLabel.font = UIFont(name: TextFont.notifications, size: 16.0)
            self.notificationLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (bool) in
            self.notificationLabel.transform = .identity
            self.notificationLabel.text = ""
            self.notificationLabel.alpha = 1
        }
    }
    
    fileprivate func check() {
       
        Analytics.logEvent(Events.CHECK_PUZZLE, parameters: nil)
        let emptyCells = self.puzzle.getEmptyCells()
        
        let incorrectAnswers:[(Int,Int)] = self.checkForIncorrectAnswers()
        
        if incorrectAnswers.count > 0 {
            countChecks += 1
            showInterstitialAd()
            self.addTimePenalty()
            for inc in incorrectAnswers {
                self.sudokuBoard[inc.0][inc.1].type = .ERROR
            }
            self.checkAnimation(cellIndices: incorrectAnswers, correct: false)
            return
        }
        
        if emptyCells.count == 0 {
            let timeTakenInSec = self.timeElapsed
            let timeTaken = Utils.dateString(forInterval: timeTakenInSec)
            if !self.puzzleSolved {
                self.puzzleSolved = true
                self.postPuzzleSolved()
            }
            self.disableInput()
            
            self.puzzleSolvedAnimation(index: (0,0), completion: {
                if (Settings.getInstance().bestTime > timeTakenInSec || Settings.getInstance().bestTime == 0) {
                    Settings.getInstance().bestTime = timeTakenInSec
                    
                    self.animateNotification(text: "New Best Time \(timeTaken)", textColor: TextColors.notifications, completion: {
                        self.newGameAlert(title: "NEW BEST TIME!", message: "You've solved the puzzle in " + timeTaken, otherActionMessage:"Done")
                    })
                }
                else {
                    self.animateNotification(text: "Time \(timeTaken)", textColor: TextColors.notifications, completion: {
                        self.newGameAlert(title: "CONGRATULATIONS!", message: "You've solved the puzzle in " + timeTaken, otherActionMessage: "Done")
                    })
                }
                self.enableInput()
            })
            return
        } else {
            countChecks += 1

            let correctAnswers = self.checkForCorrectAnswers()
            // this would mean that the user has not entered any input
            if correctAnswers.count == 0 {
                self.checkAnimationNoInput(cellIndices: emptyCells)
            } else {
                self.checkAnimation(cellIndices: correctAnswers, correct: true)
            }
            return
        }
    }
    
    func checkForIncorrectAnswers() -> [(Int,Int)] {
        var incorrectAnswers:[(Int,Int)] = []
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
        return incorrectAnswers
    }
    
    func checkForCorrectAnswers() -> [(Int,Int)] {
        var correctAnswers:[(Int,Int)] = []
        var rowCount = 0
        for row in sudokuBoard {
            var columnCount = 0
            for column in row {
                if (((column.type == .ANSWER) || (column.type == .ERROR) || (column.type == .CLUE)) && column.hasTextInput) {
                    if (column.integerValue == puzzle.solvedPuzzle[rowCount][columnCount]) {
                        correctAnswers.append((rowCount,columnCount))
                    }
                }
                columnCount += 1
            }
            rowCount += 1
        }
        return correctAnswers
    }
    
    @IBAction func settings(_ sender: Any) {
        Analytics.logEvent(Events.PUZZLE_SETTINGS, parameters: nil)
        let popUpVc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "settings") as! SettingsViewController
        self.addChildViewController(popUpVc)
        popUpVc.view.frame = self.view.frame
        self.view.addSubview(popUpVc.view)
        popUpVc.didMove(toParentViewController: self)
    }
    
    @objc func start() {
        if !self.puzzleSolved {
            self.timeElapsed = self.timeElapsed + 1
            self.timerLabel.text = Utils.dateString(forInterval: timeElapsed)
            self.timerLabel.textColor = UIColor(red: 121/255, green:121/255 , blue: 121/255, alpha: 100)
        }
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
    
    private func addTimePenalty() {
        self.timerLabel.textColor = UIColor.red
        let timePenalty: Int = Settings.getInstance().timePenalty
        let timePenaltyString = Utils.dateString(forInterval: timePenalty)
        
        self.animatePenaltyNotification(text: "+ \(timePenaltyString)", textColor: TextColors.highlight) {
            self.notificationLabel.text = ""
        }
        self.timeElapsed = timePenalty + self.timeElapsed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,  repeats: true) {
            [weak self] timer in
            self?.start()
        }
        self.enableInput()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer.invalidate()
    }
    
    func animatePenaltyNotification(text: String, textColor: UIColor, completion:@escaping ()-> Void) {
        self.notificationLabel.alpha = 0.8
        self.notificationLabel.font = UIFont(name: TextFont.notifications, size: 20.0)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.notificationLabel.textColor = textColor
            self.notificationLabel.alpha = 0
            self.notificationLabel.text = text
            self.notificationLabel.transform = CGAffineTransform(translationX: self.notificationLabel.bounds.width/2 , y:-self.notificationLabel.bounds.height)
            
        }) { bool in
            if bool {
                self.notificationLabel.transform = .identity
                self.notificationLabel.alpha = 1
                completion()
            }
        }
    }
    
    func animateNotification(text: String, textColor: UIColor, completion:@escaping ()-> Void) {
        self.notificationLabel.font = UIFont(name: TextFont.notifications, size: 16.0)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.notificationLabel.textColor = textColor
            self.notificationLabel.text = text
            self.notificationLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
        }) { bool in
            if bool {
                self.notificationLabel.transform = .identity
                completion()
            }
        }
    }
    
    func newGameAlert(title: String, message: String, otherActionMessage: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: otherActionMessage, style: .default, handler: { _ in
        }) )
        alert.addAction(UIAlertAction(title: "New Game", style: .default, handler: { _ in
            self.newGame(self) }) )
        self.present(alert, animated: true, completion: nil)
    }
    
    private func postPuzzleSolved() {
        self.clearButton.isEnabled = false
        Analytics.logEvent(Events.PUZZLE_SOLVED, parameters: ["type" : Settings.getInstance().level])
        //gameEventsDelegate.puzzleSolved(cluesTaken: <#T##Int#>, timeTaken: <#T##Int#>, timesChecked: <#T##Int#>)
    }
    
    private func disableInput() {
        self.checkButton.isEnabled = false
        self.clueButton.isEnabled = false
        self.newButton.isEnabled = false
        self.clearButton.isEnabled = false
    }
    
    private func enableInput() {
        self.checkButton.isEnabled = true
        self.clueButton.isEnabled = true
        self.newButton.isEnabled = true
        self.clearButton.isEnabled = true
    }
    
    
    //ANIMATIONS
}
