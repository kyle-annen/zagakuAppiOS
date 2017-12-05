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
        let testGoogleDate: String = "2017-02-07T10:15:00-06:00"
        let systemUnderTest = DateTimeUtilities()
        
        let resultDate: Date = systemUnderTest
            .convertISO8601Date(googleDateTime: testGoogleDate)
        
        let actualYear = calendar.component(.year, from: resultDate)
        let actualMonth = calendar.component(.month, from: resultDate)
        let actualDay = calendar.component(.day, from: resultDate)
        let actualHour = calendar.component(.hour, from: resultDate)
        let actualMinute = calendar.component(.minute, from: resultDate)
        let actualSecond = calendar.component(.second, from: resultDate)
        
        XCTAssert(actualYear == 2017)
        XCTAssert(actualMonth == 2)
        XCTAssert(actualDay == 7)
        XCTAssert(actualHour == 10)
        XCTAssert(actualMinute == 15)
        XCTAssert(actualSecond == 00)
    }
    
    func testFormatDateForCalendarSubtitle() {
        let dateTimeUtilities = DateTimeUtilities()
        let testGoogleDate: String = "2017-02-07T10:15:00-06:00"
        let testDate: Date = dateTimeUtilities.convertISO8601Date(googleDateTime: testGoogleDate)
        let actual: String = dateTimeUtilities.formatDateForCalendarSubtitle(date: testDate)
        print(actual)
        let expected: String = "Wednesday Feb 7, 2017 at 10:15am"
        
        XCTAssert(actual == expected)
    
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
