//
//  DateFormatterTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:42
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

open class DateFormatterTransform: TransformType {

    public typealias Object = Date
    public typealias JSON = String
    
    public let dateFormatter: DateFormatter
    
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    
    public func transformFromJson(_ value: Any?) -> Date? {
        
        if let dateSting = value as? String {
            return dateFormatter.date(from: dateSting)
        }
        return nil
        
    }
    
    public func transformToJson(_ value: Date?) -> String? {
        if let date = value {
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
    
}
