//
//  CRLAlomofireFeatureAPI.swift
//  CRLAlomofireFeature
//
//  Created by Ruslan Yupyn on 6/21/16.
//  Copyright © 2016 Crossroad Labs. All rights reserved.
//

import Foundation
import Future
import Alamofire
//extension

extension Alamofire.Request {
    func responseJSON() -> Future<AnyObject> {
        let p = Promise<AnyObject>()
        self.responseJSON { (response: Response<AnyObject, NSError>) in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func response() -> Future<NSData?> {
        let p = Promise<NSData?>()
        self.response { (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?) in
            if let error = error {
                p.tryFail(error)
            } else {
                p.trySuccess(data)
            }
        }
        return p.future
    }
    
    func responseData() -> Future<NSData> {
        let p = Promise<NSData>()
        self.responseData { (response: Response<NSData, NSError>) in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func responseString() -> Future<String> {
        let p = Promise<String>()
        self.responseString { (response: Response<String, NSError>) in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func responsePropertyList() -> Future<AnyObject> {
        let p = Promise<AnyObject>()
        self.responsePropertyList { (response: Response<AnyObject, NSError>) in
            switch response.result {
            case .Success(let value):
                print("RESULT class:", value.classForCoder)
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
}

class CRLAlomofireFeature {
    
}