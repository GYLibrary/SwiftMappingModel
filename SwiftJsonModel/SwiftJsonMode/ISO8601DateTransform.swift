//
//  ISO8601DateTransform.swift
//  SwiftJsonModel
//
//  Created by ZGY on 2017/1/3.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/1/3  11:08
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

open class ISO8601DateTransform: DateFormatterTransform {

    init() {
        let formatetr = DateFormatter()
        formatetr.locale = Locale(identifier: "zh-Hans")
        formatetr.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

        super.init(dateFormatter: formatetr)
    }
}
