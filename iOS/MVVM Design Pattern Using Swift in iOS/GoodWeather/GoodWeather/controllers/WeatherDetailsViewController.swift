//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by damien on 07/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModelBinding()
    }
    
    private func setUpViewModelBinding() {
        
        if let weatherViewModel = self.weatherViewModel {
            weatherViewModel.name.bind { self.cityNameLabel.text = $0 }
            weatherViewModel.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
            weatherViewModel.currentTemperature.temperatureMax.bind { self.maxTemperatureLabel.text = $0.formatAsDegree }
            weatherViewModel.currentTemperature.temperatureMin.bind { self.minTemperatureLabel.text = $0.formatAsDegree }

            }
    }
}
