//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by damien on 05/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temparetureLabel: UILabel!
    
    func configure(_ weatherViewModel: WeatherViewModel) {
        self.cityNameLabel.text = weatherViewModel.name.value
        self.temparetureLabel.text = "\(weatherViewModel.currentTemperature.temperature.value.formatAsDegree)"
    }
}
