//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by damien on 18/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

struct WeahterResult: Decodable {
    let main: Weather
}

extension WeahterResult {
    
    static var empty: WeahterResult {
        return WeahterResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
