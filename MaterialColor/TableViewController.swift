//
//  TableViewController.swift
//  MaterialColor
//
//  Created by Alexey Papin on 02.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import UIKit


class TableViewController: UITableViewController {
    let cellReuseIdentifier = "TableViewCell"
    let colorTitles = MaterialColor.rawValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

extension TableViewController {
    fileprivate func object(at indexPath: IndexPath) -> MaterialColor {
        let colorTitle = colorTitles[indexPath.section]
        let colorTones = MaterialColor.allTones(of: colorTitle)
        return colorTones[indexPath.row]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return colorTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let colorTitle = colorTitles[section]
        let colorTones = MaterialColor.allTones(of: colorTitle)
        return colorTones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let color = object(at: indexPath)
        cell.backgroundColor = color.color
        cell.textLabel?.font = UIFont(name: "SanFranciscoDisplay-Medium", size: 14.0)
        cell.textLabel?.text = "\(color.colorName): #\(color.hexValue)"
        if (color.isLight) {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let colorTitle = colorTitles[section]
        let countTones = MaterialColor.allTones(of: colorTitle).count
        return "\(colorTitle.uppercased())(\(countTones) tone(s)):"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let colorTitle = colorTitles[section]
        let countTones = MaterialColor.allTones(of: colorTitle).count
        let header = UILabel()
        header.font = UIFont(name: "SanFranciscoDisplay-Bold", size: 15.0)
        header.backgroundColor = .darkGray
        header.textColor = .white
        header.textAlignment = .center
        header.text = "\(colorTitle.uppercased()) (\(countTones)):"
        return header
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
