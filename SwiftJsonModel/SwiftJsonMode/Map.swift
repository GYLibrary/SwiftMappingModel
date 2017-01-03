//
//  Map.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  11:39
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

public protocol MapContext {
    
}

public final class Map {
    
    public let mappingType: MappingType
    
    public internal(set) var JSON: [String: Any] = [:]
    public internal(set) var isKeyPresent = false
    public internal(set) var currentValue:Any?
    public internal(set) var currentKey: String?
    var keyIsNested = false
    public internal(set) var nestedKeyDelimiter: String = "."
    public var context: MapContext?
    
    let toObject:Bool
    
    init(mappingType: MappingType,JSON: [String: Any],toObject: Bool = false, context: MapContext? = nil) {
        self.mappingType = mappingType
        self.JSON = JSON
        self.toObject = toObject
        self.context = context
    }
    
    public subscript(key: String) -> Map {
        
        return self[key,delimiter: ".",ignoreNil: false]
    }
    
    public subscript(key: String, delimiter delimiter: String) -> Map {
        let nested = key.contains(delimiter)
        
        return self[key, nested: nested, delimiter: delimiter, ignoreNil: false]
        
    }
    
    public subscript(key: String, nested nested: Bool) -> Map {
        return self[key, nested: nested, delimiter: ".", ignoreNil: false]
    }
    
    public subscript(key: String, nested nested: Bool, delimiter delimiter: String) -> Map {
        return self[key, nested: nested, delimiter: delimiter, ignoreNil: false]
    }
    
    
    public subscript(key: String, ignoreNil ignoreNil: Bool) -> Map {
        return self[key, delimiter: ".", ignoreNil: ignoreNil]
    }
    public subscript(key: String, delimiter delimiter: String, ignoreNil ignoreNil: Bool) -> Map {
        let nested = key.contains(delimiter)
        return self[key, nested: nested, delimiter: delimiter, ignoreNil: ignoreNil]
    }
    
    
    public subscript(key: String, nested nested: Bool, ignoreNil ignoreNil: Bool) -> Map {
        return self[key, nested: nested, delimiter: ".", ignoreNil: ignoreNil]
    }
     public subscript(key: String, nested nested: Bool, delimiter delimiter: String, ignoreNil ignoreNil: Bool) -> Map {
     
        currentKey = key
        keyIsNested = nested
        nestedKeyDelimiter = delimiter
        
        if nested == false {
            let object = JSON[key]
            let isNSNull = object is NSNull
            isKeyPresent = isNSNull ? true : object != nil
            currentValue = isNSNull ? nil : object
            
        } else {
            (isKeyPresent,currentValue) = valueFor(ArraySlice(key.components(separatedBy: delimiter)), dictionary: JSON)
        }
        
        if ignoreNil && currentValue == nil {
            isKeyPresent = false
        }
        
        return self
        
    }
    
    public func value<T>() -> T? {
        return currentValue as? T
    }
}


/// 解析字典、数组、数组含字典
///
/// - Parameters:
///   - keyPathComponents: keyPathComponents description
///   - dictionary: dictionary description
/// - Returns: return value description
private func valueFor(_ keyPathComponents: ArraySlice<String>,dictionary: [String: Any]) -> (Bool,Any?) {
    
    
    if keyPathComponents.isEmpty {
        return (false,nil)
    }
    
    if let keyPath = keyPathComponents.first {
        let object = dictionary[keyPath]
        
        if object is NSNull {
            return (true,nil)
        } else if let dict = object as? [String: Any], keyPathComponents.count > 1 {
            let tail = keyPathComponents.dropFirst()
            return valueFor(tail, dictionary: dict)
            
        } else if let array = object as? [Any], keyPathComponents.count > 1 {
            let tail = keyPathComponents.dropFirst()
            return valueFor(tail, array: array)
        } else {
            return (object != nil,object)
        }
        
    }
    return (false,nil)
    
}

private func valueFor(_ keyPathComponents: ArraySlice<String>, array: [Any]) -> (Bool, Any?) {

    if keyPathComponents.isEmpty {
        return (false,nil)
    }
    
    if let keyPath = keyPathComponents.first,let index = Int(keyPath),index > 0 && index < array.count {
        let object = array[index]
        
        if object is NSNull {
            return (true,nil)
        } else if let array = object as? [Any],keyPathComponents.count > 1 {
            let tail = keyPathComponents.dropFirst()
            return valueFor(tail, array: array)
        } else if let dict = object as? [String: Any],keyPathComponents.count > 1 {
            let tail = keyPathComponents.dropFirst()
            return valueFor(tail, dictionary: dict)
            
        } else {
            return (true,object)
        }
        
    }
    
    return  (false,nil)
}



