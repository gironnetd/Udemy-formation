//
//  WeatherDatasource.swift
//  GoodWeather
//
//  Created by damien on 07/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherListViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(self.cellIdentifier) not Found")
        }
        
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.cityNameLabel.text = weatherViewModel.name.value
        cell.temparetureLabel.text = weatherViewModel.currentTemperature.temperature.value.formatAsDegree

        return cell
    }
}
