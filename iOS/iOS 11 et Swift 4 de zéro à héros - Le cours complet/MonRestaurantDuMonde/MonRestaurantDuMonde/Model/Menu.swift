//
//  Menu.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Menu {
    
    private var _country: String
    private var _image: UIImage
    private var _meals: [Meal]
    
    var country: String {
        return _country
    }
    
    var image: UIImage {
        return _image
    }
    
    var meals: [Meal] {
        return _meals
    }
    
    init(country: String, image: UIImage) {
        self._country = country
        self._image = image
        self._meals = Meals.get.addMealToMenu(country: self._country)
    }
}
