//
//  DateTimeUtilities.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/29/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import Foundation

class DateTimeUtilities {
    
    func convertISO8601Date(googleDateTime: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: googleDateTime)!
    }
    
    func formatDateForCalendarSubtitle(date: Date) -> String {
        let calendar = Calendar.current
        
        let dayOfWeek = calendar.component(.weekday, from: date)
        let monthNumber = calendar.component(.month, from: date)
        let dayNumber = calendar.component(.day, from: date)
        let yearNumber = calendar.component(.year, from: date)
        let hourNumber = calendar.component(.hour, from: date)
        let minuteNumber = calendar.component(.minute, from: date)
        
        let formatter = DateFormatter()
        let months = formatter.shortMonthSymbols
        let monthSymbol = months?[monthNumber-1]
        let weekDaySymbol = formatter.weekdaySymbols[dayOfWeek]
        
        let subtitle: String = "\(weekDaySymbol) \(monthSymbol!) \(dayNumber), \(yearNumber) at \(hourNumber):\(minuteNumber)"
        print("SUBTITLE: \(subtitle)")
        
        return subtitle
    }
    

}
