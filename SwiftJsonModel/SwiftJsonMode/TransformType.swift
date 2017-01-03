//
//  TransformType.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  09:23
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

public protocol TransformType {
    
    /// 关联类型: 代指变量
    ///
    /// - Parameter value:
    /// - Returns:
    associatedtype Object
    associatedtype JSON
    
    func transformFromJson(_ value:Any?) -> Object?
    func transformToJson(_ value: Object?) -> JSON?
    
}
