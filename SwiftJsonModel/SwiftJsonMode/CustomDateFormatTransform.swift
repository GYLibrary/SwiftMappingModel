//
//  CustomDateFormatTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  10:47
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

class CustomDateFormatTransform: DateFormatterTransform {

    init(formatSting:String) {
        let formatter = DateFormatter()
        // TODO: 待解决
        formatter.locale = Locale(identifier: "zh-Hans")
        formatter.dateFormat = formatSting
        
        super.init(dateFormatter: formatter)
        
    }
}
