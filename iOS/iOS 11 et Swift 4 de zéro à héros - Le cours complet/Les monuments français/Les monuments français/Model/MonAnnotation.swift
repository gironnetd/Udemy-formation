//
//  MonAnnotation.swift
//  Les monuments français
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation{
    
    var title: String?
    var subTitle: String?
    let image = #imageLiteral(resourceName: "Group")
    var coordinate : CLLocationCoordinate2D
    
    init(titre: String, adresse: String, coordonnees: CLLocationCoordinate2D) {
        self.title = titre
        self.subTitle = adresse
        self.coordinate = coordonnees
        super.init()
    }
}
