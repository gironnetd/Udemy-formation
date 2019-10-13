//
//  Order.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}
