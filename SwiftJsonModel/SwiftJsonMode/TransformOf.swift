//
//  TransformOf.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  09:52
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

open class TransformOf<ObjectType,JSONType>: TransformType {

    public typealias Object = ObjectType
    public typealias JSON = JSONType
    
    
    
    private let fromJSON :(JSONType?) -> ObjectType?
    private let toJSON: (ObjectType?) -> JSONType?
    
    public init(fromJSON: @escaping(JSONType?) -> ObjectType?, toJSON:@escaping(ObjectType?) -> JSONType?) {
        self.fromJSON = fromJSON
        self.toJSON = toJSON
    }
    
    open func transformFromJson(_ value: Any?) -> ObjectType? {
        
        return fromJSON(value as? JSONType)
        
    }
    
    public func transformToJson(_ value: ObjectType?) -> JSONType? {
        return toJSON(value)
    }
    
    
    

    
}
