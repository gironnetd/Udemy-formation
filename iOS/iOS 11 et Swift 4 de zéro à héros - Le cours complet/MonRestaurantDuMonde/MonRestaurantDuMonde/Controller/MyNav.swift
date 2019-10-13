//
//  MyNav.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MyNav: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = BLACK
        navigationBar.tintColor = LIGHT_GRAY
        navigationBar.titleTextAttributes = [.font: BASE_FONT as Any, .foregroundColor: LIGHT_GRAY]
    }
}
