//
//  Order.swift
//  HotCoffee
//
//  Created by damien on 01/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case capucino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
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

extension Order {
    
    static var all: Resource<[Order]> = {
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("Url is incorrect")
        }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(_ viewModel: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(viewModel)
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding data")
        }
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("Url is incorrect")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
    }
}

extension Order {
    
    init?(_ viewModel: AddCoffeeOrderViewModel) {
        
        guard let name = viewModel.name,
        let email = viewModel.email,
        let selectedSize = CoffeeSize(rawValue: (viewModel.selectedSize!.lowercased())),
        let selectedType = CoffeeType(rawValue: viewModel.selectedType!.lowercased()) else {
             return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
