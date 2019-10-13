//
//  Card.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Card {
    
    private var _type: Type
    private var _meals: [Meal]
    
    var type: Type {
        return _type
    }
    
    var meals: [Meal] {
        return _meals
    }
    
    init(type: Type) {
        self._type = type
        self._meals = Meals.get.atCards(type: self._type)
    }
}
