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
        
        
        Alamofire
            .request(.GET, urlString)
            .responseString() { (response: Response<String, NSError>) in
                
                switch response.result {
                case .Success(let value):
                    print("RESULT VALUE -> ", value)
                    
                    guard value == "Test String" else {
                        let failureReason = "Data could not be serialized. Input data was nil or zero length."
                        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                        let error = NSError(domain: "CrossroadLabs.CRLAlomofireFeature", code: -6004, userInfo: userInfo)
                        XCTAssertNil(error, "Whoops, error \(error)")
                        return
                    }
                    XCTAssertEqual(value, "Test String")
                case .Failure(let error):
                    print("RESULT ERROR -> ", error)
                    XCTAssertNil(error, "Whoops, error \(error)")
                }
                asyncExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5) { error in
            XCTAssertNil(error)
        }
    }
    
    func testFileNotFound() {
        let asyncExpectation = expectationWithDescription("AlamofireResponseString")
        let urlString = "http://i.telegraph.co.uk/multimedia/archive/03504/royal-society-summ_3504012gdf.jpg"
        Alamofire
            .request(.GET, urlString)
            .responseString() { (response: Response<String, NSError>) in
                switch response.result {
                case .Success(let value):
                    print("RESULT VALUE -> |", value)
                    
                    XCTAssertEqual(response.response?.statusCode, Optional(404))
//                    XCTAssertEqual(value, "404: Not Found")
                case .Failure(let error):
                    print("RESULT ERROR -> ", error)
                    XCTAssertNil(error, "Whoops, error \(error)")
                }
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
