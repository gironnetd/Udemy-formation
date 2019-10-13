//
//  AnnotationView.swift
//  Les monuments français
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        
        willSet {
            guard let nouvelle = newValue as? MonAnnotation else { return }
            image = #imageLiteral(resourceName: "Group")
        }
    }
}
