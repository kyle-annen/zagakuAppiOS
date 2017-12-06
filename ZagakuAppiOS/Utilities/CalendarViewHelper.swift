//
//  CalendarViewHelper.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/31/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import Foundation
import UIKit

class CalendarViewHelper {
    
    let dateTimeUtilities = DateTimeUtilities()
    
    func getCellSubtitle(
        cell: UITableViewCell,
        indexPath: IndexPath,
        events: [ZagakuDate]) -> String {
        let event = events[indexPath.row]
        if let start_time = event.start_time {
            let parsedDate = dateTimeUtilities.convertISO8601Date(
            googleDateTime: start_time)
            if let date: Date = parsedDate {
                return dateTimeUtilities.formatDateForCalendarSubtitle(date: date)
            }
        }
        return ""
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
    
    func getPlistData(fileName: String) -> [Dictionary<String, Any>] {
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        
        if let filePath = path {
            let gCalRawData = (NSDictionary(contentsOfFile: filePath) as? [String: Any])!
            if let gCalItems = gCalRawData["items"] {
                 return gCalItems as! [Dictionary<String, Any>]
            }
        }
        return [Dictionary<String, Any>]()
    }
}










