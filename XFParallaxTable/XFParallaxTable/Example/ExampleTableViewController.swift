//
//  ExampleTableViewController.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/19.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

class ExampleTableViewController: UITableViewController {
    
    var model: ExampleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = ExampleModel.init(createDefaultModel: true)
        tableView.register(UINib.init(nibName: "ExampleCell", bundle: nil), forCellReuseIdentifier: ExampleTableViewCellReuseIdentifier)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.itemCount ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExampleTableViewCellReuseIdentifier) else {
            return ParallaxTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: ExampleTableViewCellReuseIdentifier)
            
        }
        // Configure the cell...
        let ec = cell as! ExampleCell
        if let m = model {
            var type = XFParallaxCellType.normal
            if let imageName = m.imageNames?[indexPath.row] as? String {
                type = .parallax
                ec.parallaxImageName = imageName
            }
            
            ec.title = m.titles[indexPath.row]
            let cellH = cell.frame.size.height
            let tableH = tableView.frame.size.height
            ec.settings = ParallaxSettings.init(type: type, rate: 100.0/(tableH + cellH))
            ec.config()
        }
        
        return cell
    }
    
    //MARK:
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return model?.cellHeights?[indexPath.row] ?? 0
    }
    
    // MARK: - ScrollView
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        ParallaxTableViewCell.tableView(didScroll: tableView)
    }
}
