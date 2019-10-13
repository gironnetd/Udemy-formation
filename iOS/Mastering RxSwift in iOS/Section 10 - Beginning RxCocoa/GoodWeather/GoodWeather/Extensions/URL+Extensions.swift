//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by damien on 18/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation


extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=92f9a216f4e34aade6ba72ffaa49f47f&units=imperial")
    }
}
