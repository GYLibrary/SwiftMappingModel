//
//  HexColorTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:56
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

open class HexColorTransform: TransformType {
    public typealias Object = UIColor
    
    public typealias JSON = String
    
    var prefix:Bool = false
    var alpha:Bool = false
    
    init(prefixToJSON:Bool = false,alphaToJSON: Bool = false) {
        alpha = alphaToJSON
        prefix = prefixToJSON
    }
    
    public func transformFromJson(_ value: Any?) -> UIColor? {
        if let rgba = value as? String {
            if rgba.hasPrefix("#") {
                let index = rgba.characters.index(rgba.startIndex, offsetBy: 1)
                let hex = rgba.substring(to: index)
                return getColor(hex: hex)
                
            }
            return getColor(hex: rgba)
        }
        return nil
    }
    
    public func transformToJson(_ value: UIColor?) -> String? {
        if let value = value {
            return hexString(color: value)
        }
        return nil
    }
    
    fileprivate func hexString(color: Object) -> String {
        let comps = color.cgColor.components!
        let r = Int(comps[0] * 255)
        let g = Int(comps[1] * 255)
        let b = Int(comps[2] * 255)
        let a = Int(comps[3] * 255)
        var hexString: String = ""
        if prefix {
            hexString = "#"
        }
        hexString += String(format: "%02X%02X%02X", r, g, b)
        
        if alpha {
            hexString += String(format: "%02X", a)
        }
        return hexString
    }
    
    fileprivate func getColor(hex:String) -> UIColor? {
        
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.characters.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                // Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8
                return nil
            }
        } else {
            return nil
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
