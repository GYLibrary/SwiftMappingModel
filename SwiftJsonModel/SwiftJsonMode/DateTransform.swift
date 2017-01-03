//
//  DateTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:24
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

open class DateTransform: TransformType {

    public typealias Object = Date
    public typealias JSON = Double
    
    public init() {}
    
    public func transformFromJson(_ value: Any?) -> Date? {
        if let timeInt = value as? Double {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }
        
        if let timeStr = value as? String {
            return Date(timeIntervalSince1970: TimeInterval(atof(timeStr)))
        }
        
        return nil
    }
    
    public func transformToJson(_ value: Date?) -> Double? {
        
        if let date = value {
            return Double(date.timeIntervalSince1970)
        }
        
        return nil
        
    }
    
}
