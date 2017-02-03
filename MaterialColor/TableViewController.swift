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
    let segueToEditColor = "segueToEditColor"
    
    var colors = [Color](titles: MaterialColor.rawValues)
    
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
    fileprivate func object(at indexPath: IndexPath) -> Tone {
        return colors[indexPath.section].tones[indexPath.row]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors[section].tones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let color = object(at: indexPath)
        cell.backgroundColor = color.color
        cell.textLabel?.font = UIFont(name: "SanFranciscoDisplay-Medium", size: 14.0)
        cell.textLabel?.text = "\(color.name): #\(color.hexValue)"
        if (color.isLight) {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(colors[section].title.uppercased())(\(colors[section].tones.count) tone(s)):"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let colorTitle = colors[section].title
        let countTones = colors[section].tones.count
        let header = UILabel()
        header.font = UIFont(name: "SanFranciscoDisplay-Bold", size: 15.0)
        header.backgroundColor = .darkGray
        header.textColor = .white
        header.textAlignment = .center
        header.text = "\(colorTitle.uppercased()) (\(countTones)):"
        return header
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let segueId = segue.identifier,
            let indexPath = tableView.indexPathForSelectedRow
            else {
            return
        }
        switch segueId {
        case segueToEditColor:
            let editColorController = segue.destination as! EditColorController
            let tone = object(at: indexPath)
            let completionOnSave = { (tone: Tone) in
                self.colors[indexPath.section].tones[indexPath.row] = tone
                self.tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
            }
            editColorController.tone = tone
            editColorController.completionOnSave = completionOnSave
        default:
            break
        }
    }
}

















