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
    let CellIdentifier = "Cell Identifier"
    var events = [Dictionary<String, Any>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Zagaku Schedule"
        
        let path = Bundle.main.path(forResource: "gCalData", ofType: "plist")
        
        if let filePath = path {
            let gCalRawData = (NSDictionary(contentsOfFile: filePath) as? [String: Any])!
            if let gCalItems = gCalRawData["items"] {
                events = gCalItems as! [Dictionary<String, Any>]
            }
        }
        
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
        if let event = events[indexPath.row] as? [String: Any] {
            if let title = event["summary"] as? String {
                cell.textLabel?.text = formatTitle(title: title)
            }
            
            if let start = event["start"] as? [String: Any],
                let dateTime = start["dateTime"] as? String {
                
                let parsedDate: Date =
                    dateTimeUtilities.convertISO8601Date(googleDateTime: dateTime)
                cell.detailTextLabel?.text =
                    dateTimeUtilities.formatDateForCalendarSubtitle(date: parsedDate)
            }
        }
    }
    
    func formatTitle(title: String) -> String {
        let titleArray: [String] = title.components(separatedBy: " - ")
        var modifiedTitle: String = ""
        
        switch titleArray.count {
            case 1:
                modifiedTitle = title
            case 2:
                modifiedTitle = titleArray[1] + " - TBD"
            case _:
                modifiedTitle = titleArray[1] + " - " + titleArray[2]
        }
        return modifiedTitle
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
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
