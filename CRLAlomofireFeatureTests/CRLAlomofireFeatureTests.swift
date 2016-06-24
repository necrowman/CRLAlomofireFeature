//
//  CRLAlomofireFeatureTests.swift
//  CRLAlomofireFeatureTests
//
//  Created by Ruslan Yupyn on 6/21/16.
//  Copyright © 2016 Crossroad Labs. All rights reserved.
//

import XCTest
import Alamofire
import Future
import CRLAlomofireFeature


class CRLAlomofireFeatureTests: XCTestCase {
    
    let correctURLBase = "https://raw.githubusercontent.com/necrowman/CRLAlomofireFeature/master/"
    let uncorrectURLBase = "https://raw.githubusercontent12.com/necrowman/CRLAlomofireFeature/master/"
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: - responseString() -> Future<String> testing
    func testSimpleString() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(correctURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).responseString()
        future.onSuccess { value in
            print("RESULT VALUE -> ", value)
            XCTAssertEqual(value, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTFail("Whoops, error \(error)")
            asyncExpectation.fulfill()
        }

        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testSimpleStringServerNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(uncorrectURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).responseString()
        future.onSuccess { value in
            print("RESULT VALUE -> ", value)
            XCTFail("Whoops, error \(value)")
            XCTAssertEqual(value, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTAssertNotNil(error)
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    //MARK: - responseJSON() -> Future<AnyObject> testing
    func testSimpleJSONStringParsing() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(correctURLBase)simpleJSONURL.json"
        let future = Alamofire.request(.GET, urlString).responseJSON()
        future.onSuccess { value in

            let stringValue = value["testString"]
            print("RESULT VALUE -> ", stringValue)
            XCTAssertEqual(stringValue, "string value")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTFail("Whoops, error \(error)")
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testSimpleJSONServerNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(uncorrectURLBase)simpleJSONURL.json"
        let future = Alamofire.request(.GET, urlString).responseJSON()
        future.onSuccess { value in
            
            let stringValue = value["testString"]
            print("RESULT VALUE -> ", stringValue)
            XCTFail("Whoops, error \(stringValue)")
            XCTAssertEqual(stringValue, "string value")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTAssertNotNil(error)
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    //MARK: - response() -> Future<NSData?> testing
    func testResponse() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(correctURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).response()
        future.onSuccess { value in
            
            let string = String(data: value!, encoding: NSUTF8StringEncoding)!
            print("RESULT VALUE -> ", string)
            XCTAssertEqual(string, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTFail("Whoops, error \(error)")
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testResponseServerNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(uncorrectURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).response()
        future.onSuccess { value in
            
            let string = String(data: value!, encoding: NSUTF8StringEncoding)!
            print("RESULT VALUE -> ", string)
            XCTFail("Whoops, error \(string)")
            XCTAssertEqual(string, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTAssertNotNil(error)
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    //MARK: - responseData() -> Future<NSData> testing
    func testResponseData() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(correctURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).responseData()
        future.onSuccess { value in
            
            let string = String(data: value, encoding: NSUTF8StringEncoding)!
            print("RESULT VALUE -> ", string)
            XCTAssertEqual(string, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTFail("Whoops, error \(error)")
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testResponseDataServerNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(uncorrectURLBase)simpleTestURL.txt"
        let future = Alamofire.request(.GET, urlString).responseData()
        future.onSuccess { value in
            
            let string = String(data: value, encoding: NSUTF8StringEncoding)!
            print("RESULT VALUE -> ", string)
            XCTFail("Whoops, error \(string)")
            XCTAssertEqual(string, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTAssertNotNil(error)
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    //MARK: - responseData() -> Future<NSData> testing
    func testResponsePropertyList() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(correctURLBase)simpleTestPlist.plist"
        
        
        
        let future = Alamofire.request(.GET, urlString).responsePropertyList()
        future.onSuccess { value in
            
            print("RESULT VALUE -> ", value)
            XCTAssertEqual(value as? String, "testStringKey")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTFail("Whoops, error \(error)")
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testResponsePropertyListServerNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "\(uncorrectURLBase)simpleTestPlist.plist"
        let future = Alamofire.request(.GET, urlString).responseData()
        future.onSuccess { value in
            
            let string = String(data: value, encoding: NSUTF8StringEncoding)!
            print("RESULT VALUE -> ", string)
            XCTFail("Whoops, error \(string)")
            XCTAssertEqual(string, "Test String")
            asyncExpectation.fulfill()
        }
        future.onFailure { error in
            print("ERROR VALUE -> ", error)
            XCTAssertNotNil(error)
            asyncExpectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
