//
//  AchievementViewController.swift
//  Solve My Sudoku
//
//  Created by Varun Ajmera on 6/23/18.
//  Copyright © 2018 Varun Ajmera. All rights reserved.
//

import UIKit


class AchievementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var totalAchievements: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.totalAchievements.text = "\(UserAchievements.getInstance().total)"
        self.tableView.rowHeight = 40.0
    }

    @IBAction func exit(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return UserAchievements.getInstance().unearned.count
        }
        return UserAchievements.getInstance().earnedAchievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            if let acCell = cell as? CustomTableCell {
                acCell.numberOfStars?.text = String(UserAchievements.getInstance().unearned[indexPath.row].stars) + " x"
                acCell.summary?.text = UserAchievements.getInstance().unearned[indexPath.row].description
                acCell.currentLevel?.text = UserAchievements.getInstance().unearned[indexPath.row].currentLevel
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

            if let acCell = cell as? CustomTableCell {
                acCell.numberOfStars?.text = String(UserAchievements.getInstance().earnedAchievements[indexPath.row].stars) + " x"
                acCell.summary?.text = UserAchievements.getInstance().earnedAchievements[indexPath.row].description
                //acCell.currentLevel?.text = UserAchievements.getInstance().earnedAchievements[indexPath.row].currentLevel
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Unearned"
        }
        return "Earned"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
//        return view
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.backgroundColor = UIColor.white
        header.textLabel?.font = UIFont(name: TextFont.avenirMedium, size: 15)!
        header.textLabel?.textColor = UIColor.black
    }
}
