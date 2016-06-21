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
        self.responseJSON() { response in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func response() -> Future<AnyObject> {
        let p = Promise<AnyObject>()
        self.response() { response in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func responseString(encoding: NSStringEncoding) -> Future<AnyObject> {
        let p = Promise<AnyObject>()
        self.responseString(encoding) { response in
            switch response.result {
            case .Success(let value):
                p.trySuccess(value)
            case .Failure(let error):
                p.tryFail(error)
            }
        }
        return p.future
    }
    
    func responsePropertyList(options: NSPropertyListReadOptions) -> Future<AnyObject> {
        let p = Promise<AnyObject>()
        self.responsePropertyList(options) { response in
            switch response.result {
            case .Success(let value):
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