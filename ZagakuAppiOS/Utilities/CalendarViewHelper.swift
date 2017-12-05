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
        let dateTime = events[indexPath.row].start_time
        if let unwrappedDateTime: String = dateTime {
            
            let parsedDate: Date = dateTimeUtilities.convertISO8601Date(googleDateTime: unwrappedDateTime)
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










