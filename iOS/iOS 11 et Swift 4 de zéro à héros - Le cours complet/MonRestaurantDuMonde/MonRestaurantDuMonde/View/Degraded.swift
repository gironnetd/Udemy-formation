//
//  Degraded.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Degraded: CAGradientLayer {
    
    override init(layer: Any) {
        super.init(layer: layer)
        initDegraded()
    }
    
    override init() {
        super.init()
        initDegraded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDegraded()
    }
    
    func initDegraded() {
        frame = UIScreen.main.bounds
        colors = [BLACK.cgColor, DARK_GRAY.cgColor]
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 1, y: 1)
        locations = [0, 1]
    }
}
