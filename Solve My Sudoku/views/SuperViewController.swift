//
//  SuperViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 5/23/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SuperViewController: UIViewController, GADInterstitialDelegate {
    
    var solverService: SolverService!
    var sudokuBoard:[[SudoKoCellView]] = []
    var interstitial: GADInterstitial!
    var count: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        let x = UIColor(red: 152.0/255.0, green: 218.0/255.0, blue: 252.0/255.0, alpha: 82.0)
        UIApplication.shared.statusBarView?.backgroundColor = x
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: TextFont.avenirDemiBold, size:14)!], for: .normal)
        // Interstitial Ad
        DispatchQueue.global().async { [weak self] in
            self?.interstitial = self?.createAndLoadInterstitial()
        }
    }
    
    

    func showAlert(title: String, message: String, actionMessage: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionMessage, style: UIAlertActionStyle.default, handler: { _ in
        }) )
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showInterstitialAd() {
        count += 1
        if count == 3 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
                count = 0
            }
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        interstitial = GADInterstitial(adUnitID: Configuration.interstitialAdUnit)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }

    func highlightCells(cells:[(Int,Int)]) {
        for cell in cells {
            self.sudokuBoard[cell.0][cell.1].type = .INPUT_ERROR
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var shouldAutorotate: Bool {
        get {
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
