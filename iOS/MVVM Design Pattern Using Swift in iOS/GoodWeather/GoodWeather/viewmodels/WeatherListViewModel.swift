//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by damien on 05/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

class WeatherListViewModel {
    
    private(set) var weatherListViewModel = [WeatherViewModel]()
    
    func addWeatherViewModel(_ viewModel: WeatherViewModel) {
        self.weatherListViewModel.append(viewModel)
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        return self.weatherListViewModel.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherListViewModel[index]
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelsius() {
        
        weatherListViewModel = weatherListViewModel.map { viewModel in
            
            let weatherViewModel = viewModel
            weatherViewModel.currentTemperature.temperature.value =
            (weatherViewModel.currentTemperature.temperature.value - 32) * 5/9
            
            return weatherViewModel
        }
    }
    
    private func toFahrenheit() {
        
        weatherListViewModel = weatherListViewModel.map { viewModel in
            
            let weatherViewModel = viewModel
            weatherViewModel.currentTemperature.temperature.value =
                (weatherViewModel.currentTemperature.temperature.value * 9/5) + 32
            
            return weatherViewModel
        }
    }
}

// Type Eraser

class Dynamic<T>: Decodable where T: Decodable {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}

struct WeatherViewModel: Decodable {
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Dynamic<Double>
    let temperatureMin: Dynamic<Double>
    let temperatureMax: Dynamic<Double>
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temperatureMax))
        temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temperatureMin))
    }
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax =  "temp_max"
    }
}
