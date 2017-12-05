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
    
    func getCellTitle(
        cell: UITableViewCell,
        indexPath: IndexPath,
        events: [Dictionary<String, Any>]) -> String
    {
        
        if let event = events[indexPath.row] as? [String: AnyObject],
            let title = event["summary"] as? String {
            return formatTitle(title: title)
        } else {
            return ""
        }
    }
    
    func getCellSubtitle(
        cell: UITableViewCell,
        indexPath: IndexPath,
        events: [Dictionary<String, Any>]) -> String
    {
        if let event = events[indexPath.row] as? [String: AnyObject],
            let start = event["start"] as? [String: AnyObject],
            let dateTime = start["dateTime"] as? String {
            let parsedDate: Date = dateTimeUtilities.convertISO8601Date(googleDateTime: dateTime)
            return dateTimeUtilities.formatDateForCalendarSubtitle(date: parsedDate)
        } else {
            return ""
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










