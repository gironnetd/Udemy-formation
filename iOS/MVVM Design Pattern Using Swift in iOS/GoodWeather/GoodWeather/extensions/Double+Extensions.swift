//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by damien on 06/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
