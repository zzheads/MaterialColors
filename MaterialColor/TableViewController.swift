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
    var materialColors: [Toneable]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materialColors.append(MaterialColor.red.allTones as! Toneable)
        materialColors.append(MaterialColor.pink.allTones as! Toneable)
        materialColors.append(MaterialColor.purple.allTones as! Toneable)
        materialColors.append(MaterialColor.deepPurple.allTones as! Toneable)
        materialColors.append(MaterialColor.indigo.allTones as! Toneable)        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = 
        return cell
    }
}
