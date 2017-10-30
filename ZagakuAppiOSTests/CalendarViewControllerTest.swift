//
//  CalendarViewControllerTest.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/29/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import XCTest
@testable import ZagakuAppiOS

class CalendarViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testFormatTitleParsesFullTitle() {
        let systemUnderTest = CalendarViewController()
        let testTitle = "Zagaku - Eric S - Kata for great good"
        let expected = "Eric S - Kata for great good"
        let actual = systemUnderTest.formatTitle(title: testTitle)
        
        XCTAssert(actual == expected)
    }
    
    func testFormatTitleParsesPartialTitle() {
    let systemUnderTest = CalendarViewController()
        let testTitle = "Zagaku - Eric S"
        let expected = "Eric S - TBD"
        let actual = systemUnderTest.formatTitle(title: testTitle)
        print("Title Actual: \(actual)")
        
        XCTAssert(actual == expected)    
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
