//
//  CardController.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class CardController: UITableViewController {

    let cellId = "MealCell"
    
    var allMeals = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: tableView.bounds)
        view.layer.addSublayer(Degraded())
        tableView.backgroundView = view
        
        allMeals = Meals.get.completeCard()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return allMeals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMeals[section].meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = allMeals[indexPath.section].meals[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MealCell {
            cell.initMeal(meal: meal)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let typeOfMeals = allMeals[section].type
        
        switch typeOfMeals {
        case .entree: return "Nos entrées"
        case .maindish: return "Nos plats principaux"
        case .dessert: return "Nos desserts"
        }
    }
}






