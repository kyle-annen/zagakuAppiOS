//
//  ZagakuServerRequestTests.swift
//  ZagakuAppiOSTests
//
//  Created by Kyle Annen on 12/4/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import XCTest
@testable import ZagakuAppiOS

class ZagakuServerAPIClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetRequestParametersWithOneParam() {
        let sut = ZagakuServerAPIClient()
        let requestDict: Dictionary<String, String> = ["time_period": "past"]
        let result: String = sut.getRequestParameters(parameters: requestDict)
        XCTAssertEqual(result, "time_period=past")
    }
    
    func testGetRequestParametersWithTwoParam() {
        let sut = ZagakuServerAPIClient()
        let requestDict: Dictionary<String, String> = [
            "time_period": "past",
            "style":"funky"]
        let result: String = sut.getRequestParameters(parameters: requestDict)
        XCTAssertEqual(result, "style=funky&time_period=past")
    }
    
    func testGetRequestParametersWithManyParam() {
        let sut = ZagakuServerAPIClient()
        let requestDict: Dictionary<String, String> = [
            "time_period": "past",
            "style":"funky",
            "other_thing":"yeah",
            "last_thing":"cool"]
        let result: String = sut.getRequestParameters(parameters: requestDict)
        XCTAssertEqual(result, "last_thing=cool&other_thing=yeah&style=funky&time_period=past")
    }
    
    func testGetRequestUrlReturnsFormatedRequestURL() {
        let sut = ZagakuServerAPIClient()
        let parameters: Dictionary<String, String> = [
            "time_period": "past",
            "name": "fred",
            "this": "that"]
        let url = "http://test.com/api/events"
        let result = sut.getRequestURL(baseURL: url, parameters: parameters)
        XCTAssertEqual(result, "http://test.com/api/events?name=fred&this=that&time_period=past")
    }
    
    func testGetResponseGetsData() {
        
        let sut = ZagakuServerAPIClient()
        let params: Dictionary<String, String> = ["time_period": "upcoming"]
        let url = "http://localhost:3000/api/events"
        let callback: ([ZagakuDate]) -> () = {
            (arg: [ZagakuDate]) -> Void in
            print(arg)
            XCTAssert(true)
        }
        
        sut.request( baseURL: url, parameters: params, completion: callback)
    }
}




















