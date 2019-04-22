//
//  ParallaxTableViewController.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/19.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

class ParallaxTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: - ScrollView
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
        
        for case let cell as ParallaxTableViewCell in tableView.visibleCells {
            guard cell.settings?.type == .parallax else {
                continue
            }
            
            let cellY = cell.frame.origin.y
            let tableH = tableView.frame.size.height
            let scrollY = cellY > tableH ? tableView.contentOffset.y - (cellY - tableH) : tableView.contentOffset.y
            
            cell.moveOffsetY(scrollY: scrollY)
        }
    }
}
