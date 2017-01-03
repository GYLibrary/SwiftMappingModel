//
//  Mappable.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  11:33
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

public protocol BaseMappable {
    
    mutating func mapping(map: Map)
}

public protocol Mappable: BaseMappable {
    init?(map: Map)
}

public protocol StaticMappable: BaseMappable {
    
    static func objectForMapping(map: Map) -> BaseMappable?
}

public extension BaseMappable {
    
    public init?(JSONString: String, context: MapContext? = nil) {
        if let obj: Self = Mapper(context: context).map(JSONString: JSONString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initializes object from a JSON Dictionary
    public init?(JSON: [String: Any], context: MapContext? = nil) {
        if let obj: Self = Mapper(context: context).map(JSON: JSON) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Returns the JSON Dictionary for the object
    public func toJSON() -> [String: Any] {
        return Mapper().toJSON(self)
    }
    
    /// Returns the JSON String for the object
    public func toJSONString(prettyPrint: Bool = false) -> String? {
        return Mapper().toJSONString(self, prettyPrint: prettyPrint)
    }
}

public extension Array where Element: BaseMappable {
    
    /// Initialize Array from a JSON String
    public init?(JSONString: String, context: MapContext? = nil) {
        if let obj: [Element] = Mapper(context: context).mapArray(JSONString: JSONString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initialize Array from a JSON Array
    public init?(JSONArray: [[String: Any]], context: MapContext? = nil) {
        if let obj: [Element] = Mapper(context: context).mapArray(JSONArray: JSONArray) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Returns the JSON Array
    public func toJSON() -> [[String: Any]] {
        return Mapper().toJSONArray(self)
    }
    
    /// Returns the JSON String for the object
    public func toJSONString(prettyPrint: Bool = false) -> String? {
        return Mapper().toJSONString(self, prettyPrint: prettyPrint)
    }
}

public extension Set where Element: BaseMappable {
    
    /// Initializes a set from a JSON String
    public init?(JSONString: String, context: MapContext? = nil) {
        if let obj: Set<Element> = Mapper(context: context).mapSet(JSONString: JSONString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initializes a set from JSON
    public init?(JSONArray: [[String: Any]], context: MapContext? = nil) {
        guard let obj = Mapper(context: context).mapSet(JSONArray: JSONArray) as Set<Element>? else {
            return nil
        }
        self = obj
    }
    
    /// Returns the JSON Set
    public func toJSON() -> [[String: Any]] {
        return Mapper().toJSONSet(self)
    }
    
    /// Returns the JSON String for the object
    public func toJSONString(prettyPrint: Bool = false) -> String? {
        return Mapper().toJSONString(self, prettyPrint: prettyPrint)
    }
}

