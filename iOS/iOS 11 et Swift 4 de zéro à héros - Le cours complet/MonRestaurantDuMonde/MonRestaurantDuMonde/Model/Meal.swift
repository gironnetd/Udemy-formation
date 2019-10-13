//
//  Meal.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Meal {
    
    private var _type: Type
    private var _country: String
    private var _desc: String
    private var _image: UIImage
    
    var type: Type {
        return _type
    }
    
    var country: String {
        return _country
    }
    
    var desc: String {
        return _desc
    }
    
    var image: UIImage {
        return _image
    }
    
    init(type: Type, country: String, desc: String, image: UIImage) {
        self._type = type
        self._country = country
        self._desc = desc
        self._image = image
    }
}
