//
//  CalendarViewController.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/29/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import UIKit

class CalendarViewController: UITableViewController {
    
    let dateTimeUtilities = DateTimeUtilities()
    let calendarViewHelper = CalendarViewHelper()
    let CellIdentifier = "Cell Identifier"
    let segueEventViewController = "EventViewController"
    var events = [Dictionary<String, Any>]()
    var senderIndexRow: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Zagaku Schedule"
        self.events = CalendarViewHelper().getPlistData(fileName: "gCalData")
        let calendarIcon = UIImage.init(named: "calendar")
        tabBarItem = UITabBarItem.init(title: title, image: calendarIcon, tag: 1)
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell( style: UITableViewCellStyle.subtitle, reuseIdentifier: CellIdentifier)
        
        setCellLabels(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func setCellLabels(cell: UITableViewCell, indexPath: IndexPath) {
        
        cell.textLabel?.text = calendarViewHelper
            .getCellTitle( cell: cell, indexPath: indexPath, events: self.events)
        
        cell.detailTextLabel?.text = calendarViewHelper
            .getCellSubtitle( cell: cell, indexPath: indexPath, events: self.events)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueEventViewController {
            if let destinationViewController = segue.destination as? EventViewController {
                    destinationViewController.event = events[senderIndexRow]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellIndex = tableView.indexPathForSelectedRow?.row as? Int {
            senderIndexRow = cellIndex
            self.performSegue(withIdentifier: segueEventViewController, sender: self)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
   
}
