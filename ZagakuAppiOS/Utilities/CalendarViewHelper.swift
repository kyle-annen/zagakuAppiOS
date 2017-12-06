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
        return formatDate(dateTime: event.start_time)
    }
    
    func formatDate(dateTime: String?) -> String {
        if let start_time = dateTime {
            let parsedDate = dateTimeUtilities.convertISO8601Date(googleDateTime: start_time)
            if let date = parsedDate {
                return dateTimeUtilities.formatDateForCalendarSubtitle(date: date)
            }
        }
        return "Date uknown."
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
}
