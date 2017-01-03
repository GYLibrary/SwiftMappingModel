//
//  URLTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  09:32
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

class URLTransform: TransformType {

    public  typealias Object = URL
    public  typealias JSON = String
    
    private let shouldEncodeURLString: Bool
    
    public init(shouldEncodeURLString: Bool = true) {
        self.shouldEncodeURLString = shouldEncodeURLString
    }
    
    
    /// Any 转化URL
    ///
    /// - Parameter value: Any
    /// - Returns: URL
    open func transformFromJson(_ value: Any?) -> URL? {
        
        guard let URLString = value as? String else { return nil}
        
        if !shouldEncodeURLString {
            return URL(string: URLString)
        }
        
        
        /// 解码
        guard let escapedURLString = URLString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil}
        
        return URL(string: escapedURLString)
        
    }
    
    
    /// URL 转化为String
    ///
    /// - Parameter value: URL 可为nil
    /// - Returns: String
    func transformToJson(_ value: URL?) -> String? {
        
        if let URL = value {
            return URL.absoluteString
        }
        return nil
    }
    
}
