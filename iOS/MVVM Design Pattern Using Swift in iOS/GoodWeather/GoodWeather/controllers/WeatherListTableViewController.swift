//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by damien on 05/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.dataSource = TableViewDataSource(cellIdentifier: "WeatherCell",
                                              items: self.weatherListViewModel.weatherListViewModel) { cell, viewModel in
                        cell.cityNameLabel.text = viewModel.name.value
                        cell.temparetureLabel.text = viewModel.currentTemperature.temperature.value.formatAsDegree
        }
        
        self.tableView.dataSource = self.dataSource
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailsViewController" {
            prepareSegueForWeatherDetailsViewController(segue: segue)
        }
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let navigation = segue.destination as? UINavigationController else {
            fatalError("NavigationController not Found")
        }
        
        guard let addWeatherCityViewController = navigation.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not Found")
        }
        addWeatherCityViewController.delegate = self
    }
    
    private func prepareSegueForSettingsViewController(segue: UIStoryboardSegue) {
        
        guard let navigation = segue.destination as? UINavigationController else {
            fatalError("NavigationController not Found")
        }
        
        guard let settingsTableViewController = navigation.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not Found")
        }
        settingsTableViewController.delegate = self
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        
        guard let weatherDetailsViewController = segue.destination as? WeatherDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsViewController.weatherViewModel = weatherViewModel
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(_ viewModel: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(viewModel)
        self.dataSource.updateItems(self.weatherListViewModel.weatherListViewModel)
        self.tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    
    func settingsDone(_ viewModel: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
        self.tableView.reloadData()
    }
}
