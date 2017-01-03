//
//  DictionaryTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:40
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

///Transforms [String: AnyObject] <-> [Key: Value] where Key is RawRepresentable as String, Value is Mappable
public struct DictionaryTransform<Key, Value>: TransformType where Key: Hashable, Key: RawRepresentable, Key.RawValue == String, Value: Mappable {
    
    public init() {
        
    }
    
    public func transformFromJson(_ value: Any?) -> [Key: Value]? {
        
        guard let json = value as? [String: Any] else {
            
            return nil
        }
        
        let result = json.reduce([:]) { (result, element) -> [Key: Value] in
            
            guard
                let key = Key(rawValue: element.0),
                let valueJSON = element.1 as? [String: Any],
                let value = Value(JSON: valueJSON)
                else {
                    
                    return result
            }
            
            var result = result
            result[key] = value
            return result
        }
        
        return result
    }
    
    public func transformToJson(_ value: [Key: Value]?) -> Any? {
        
        let result = value?.reduce([:]) { (result, element) -> [String: Any] in
            
            let key = element.0.rawValue
            let value = element.1.toJSON()
            
            var result = result
            result[key] = value
            return result
        }
        
        return result
    }
}

