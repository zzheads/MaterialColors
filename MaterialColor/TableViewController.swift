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
    let materialColors = MaterialColor.allColors
    
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
        return materialColors[indexPath.row]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let color = object(at: indexPath)
        cell.backgroundColor = color.color
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.text = "\(color.colorNameWithTone): #\(color.hexValue)"
        if (color.isLight) {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .white
        }
        return cell
    }
}
