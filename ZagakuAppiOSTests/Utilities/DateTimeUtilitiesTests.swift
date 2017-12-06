//
//  testDateTimeUtilities.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/29/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import XCTest
@testable import ZagakuAppiOS

class DateTimeUtilitesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConvertGoogleISO8601DateTime() {
        let calendar = Calendar.current
        let testGoogleDate: String? = Optional("2017-12-21T16:15:00.000Z")
        let systemUnderTest = DateTimeUtilities()
        
        let resultDate = systemUnderTest
            .convertISO8601Date(googleDateTime: testGoogleDate)
        if let unwrappedResultDate = resultDate {
            let actualYear = calendar.component(.year, from: unwrappedResultDate)
            let actualMonth = calendar.component(.month, from: unwrappedResultDate)
            let actualDay = calendar.component(.day, from: unwrappedResultDate)
            let actualHour = calendar.component(.hour, from: unwrappedResultDate)
            let actualMinute = calendar.component(.minute, from: unwrappedResultDate)
            let actualSecond = calendar.component(.second, from: unwrappedResultDate)
        
            XCTAssert(actualYear == 2017)
            XCTAssert(actualMonth == 12)
            XCTAssert(actualDay == 21)
            XCTAssert(actualHour == 10)
            XCTAssert(actualMinute == 15)
            XCTAssert(actualSecond == 00)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFormatDateForCalendarSubtitle() {
        let dateTimeUtilities = DateTimeUtilities()
        let testGoogleDate: String? = Optional("2017-12-21T16:15:00.000Z")
        let testDate = dateTimeUtilities.convertISO8601Date(googleDateTime: testGoogleDate)!
        let actual: String = dateTimeUtilities.formatDateForCalendarSubtitle(date: testDate)
        print(actual)
        let expected: String = "Friday Dec 21, 2017 at 10:15am"
        
        XCTAssert(actual == expected)
    
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
