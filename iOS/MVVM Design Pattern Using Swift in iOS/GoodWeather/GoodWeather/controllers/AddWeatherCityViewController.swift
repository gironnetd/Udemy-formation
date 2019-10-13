//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by damien on 05/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(_ viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField! {
        didSet {
            self.cityNameTextField.bind { self.addCityViewModel.city = $0 }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            self.stateTextField.bind { self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            self.zipCodeTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }

    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=92f9a216f4e34aade6ba72ffaa49f47f&units=metric")!
       
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in
                
                let weatherViewModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherViewModel
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                
                if let weatherViewModel = result {
                    
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(weatherViewModel)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
