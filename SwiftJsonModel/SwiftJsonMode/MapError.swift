//
//  MapError.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  11:17
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

public struct MapError: Error {
    
    public var key: String?
    public var currentValue: Any?
    public var reason: String?
    public var file: StaticString?
    public var function: StaticString?
    public var line: UInt?
    
    
    public init(key: String?, currentValue: Any?, reason: String?, file: StaticString? = nil, function: StaticString? = nil, line: UInt? = nil) {
        self.key = key
        self.currentValue = currentValue
        self.reason = reason
        self.file = file
        self.function = function
        self.line = line
    }
    
}

extension MapError: CustomStringConvertible {
    
    private var location: String? {
        guard let file = file,let function = function, let line = line else {
            return nil
        }
        
        let fileName = ((String(describing: file).components(separatedBy: "/").last ?? "").components(separatedBy: ".").first ?? "")
        
        return "\(fileName).\(function):\(line)"
        
    }
    
    public var description: String {
        
        let info:[(String,Any?)] = [("- reason",reason),
                                    ("- location",location),
                                    ("- key",key),
                                    ("- currentValue",currentValue)]
        let infoSting = info.map {"\($0):\($1 ?? "nil")"}.joined(separator: "\n")
        
        return "Got an error while mapping.\n\(infoSting)"
  
    }
}
