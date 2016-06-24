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
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimpleString() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "https://raw.githubusercontent.com/necrowman/CRLAlomofireFeature/master/simpleTestURL.txt"
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
        let urlString = "https://raw.githubusercontent12.com/necrowman/CRLAlomofireFeature/master/simpleTestURL.txt"
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
    
    func testSimpleJSON() {
//        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
//        let urlString = "https://raw.githubusercontent.com/necrowman/CRLAlomofireFeature/master/simpleTestURL.txt"
//        let future = Alamofire.request(.GET, urlString).responseString()
//        future.onSuccess { value in
//            print("RESULT VALUE -> ", value)
//            XCTAssertEqual(value, "Test String")
//            asyncExpectation.fulfill()
//        }
//        future.onFailure { error in
//            print("ERROR VALUE -> ", error)
//            XCTFail("Whoops, error \(error)")
//            asyncExpectation.fulfill()
//        }
//        
//        self.waitForExpectationsWithTimeout(5) { error in
//            XCTAssertNil(error)
//        }
    }
    
    func testSimpleJSONServerNotFound() {
//        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
//        let urlString = "https://raw.githubusercontent12.com/necrowman/CRLAlomofireFeature/master/simpleTestURL.txt"
//        let future = Alamofire.request(.GET, urlString).responseString()
//        future.onSuccess { value in
//            print("RESULT VALUE -> ", value)
//            XCTFail("Whoops, error \(value)")
//            XCTAssertEqual(value, "Test String")
//            asyncExpectation.fulfill()
//        }
//        future.onFailure { error in
//            print("ERROR VALUE -> ", error)
//            XCTAssertNotNil(error)
//            asyncExpectation.fulfill()
//        }
//        
//        self.waitForExpectationsWithTimeout(5) { error in
//            XCTAssertNil(error)
//        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
