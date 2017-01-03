//
//  EnumTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:03
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

open class EnumTransform<T: RawRepresentable>: TransformType {

    public typealias Object = T
    public typealias JSON = T.RawValue
    
    public init() {}
    
    public func transformFromJson(_ value: Any?) -> T? {
        if let raw = value as? T.RawValue {
            return T(rawValue: raw)
        }
        return nil
    }
    
    public func transformToJson(_ value: T?) -> T.RawValue? {
        if let obj = value {
            return obj.rawValue
        }
        return nil
    }
    
}
