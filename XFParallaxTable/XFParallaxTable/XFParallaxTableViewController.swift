//
//  XFParallaxTableViewController.swift
//  XFParallaxTable
//
//  Created by 张广路 on 2019/4/12.
//  Copyright © 2019 symbool. All rights reserved.
//

import UIKit

class XFParallaxTableViewController: UITableViewController {
    
    var model: XFParallaxTableModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        model = XFParallaxTableModel.init(createDefaultModel: true)
        tableView.register(UINib.init(nibName: "XFParallaxTableViewCell", bundle: nil), forCellReuseIdentifier: XFParallaxTableViewCellReuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model?.itemCount ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: XFParallaxTableViewCellReuseIdentifier) else {
            return XFParallaxTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: XFParallaxTableViewCellReuseIdentifier)
            
        }
        // Configure the cell...
        let parallaxCell = cell as! XFParallaxTableViewCell
        parallaxCell.parallaxImageName = model?.imageNames?[indexPath.row]
        parallaxCell.title = model?.titles[indexPath.row]
        parallaxCell.config()
        
        return cell
    }
    
    //MARK:
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return model?.cellHeights?[indexPath.row] ?? 0
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
