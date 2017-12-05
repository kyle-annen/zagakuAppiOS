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
    let cellIdentifier = "Cell Identifier"
    let segueEventViewController = "EventViewController"
    var events = [ZagakuDate]()
    var senderIndexRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Zagakus"

        let cellLoadCallback: ([ZagakuDate]) -> Void = {
            (allEvents: [ZagakuDate]) -> Void in
            self.events = allEvents
            self.tableView.register(
                UITableViewCell.classForCoder(),
                forCellReuseIdentifier: self.cellIdentifier)}
        
        let zagakuServerAPIClient = ZagakuServerAPIClient()
        let params: Dictionary<String, String> = ["time_period": "past"]
        let baseURL: String = "https://localhost:3000/api/events"
        
        zagakuServerAPIClient.getCalendarDates(
            baseURL: baseURL,
            parameters: params,
            completion: cellLoadCallback)
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
        let cell = UITableViewCell( style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        setCellLabels(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func setCellLabels(cell: UITableViewCell, indexPath: IndexPath) {
        
        cell.textLabel?.text = events[indexPath.row].summary
        
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
        if let cellIndex = tableView.indexPathForSelectedRow?.row {
            senderIndexRow = cellIndex
            self.performSegue(withIdentifier: segueEventViewController, sender: self)
        }
    }
}
