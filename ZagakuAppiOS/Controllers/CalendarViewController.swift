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
        title = "All Zagakus"
        self.events = CalendarViewHelper().getPlistData(fileName: "gCalData")
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

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

}
