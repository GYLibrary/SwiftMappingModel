//
//  NSDecimalNumberTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  11:10
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

open class NSDecimalNumberTransform: TransformType {
    
    public typealias Object = NSDecimalNumber
    public typealias JSON = String
    
    public init() {
        
    }
    
    public func transformFromJson(_ value: Any?) -> NSDecimalNumber? {
        if let string = value as? String {
            return NSDecimalNumber(string: string)
        }
        
        if let double = value as? Double {
            return NSDecimalNumber(value: double)
        }
        return nil
    }
    
    public func transformToJson(_ value: NSDecimalNumber?) -> String? {
        guard let value = value else {
            return nil
        }
        return value.description
    }
    
}
