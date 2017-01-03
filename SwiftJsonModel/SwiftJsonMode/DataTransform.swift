//
//  DataTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:34
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

open class DataTransform: TransformType {

    public typealias Object = Data
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJson(_ value: Any?) -> Data? {
        
        guard let string = value as? String else {
            return nil
        }
        
        return Data(base64Encoded: string)
    }
    
    public func transformToJson(_ value: Data?) -> String? {
        guard let data = value else {
            return nil
        }
        
        return data.base64EncodedString()
    }
}
