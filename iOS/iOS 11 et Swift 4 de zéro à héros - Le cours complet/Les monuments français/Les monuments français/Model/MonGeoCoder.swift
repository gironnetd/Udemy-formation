//
//  MonGeoCoder.swift
//  Les monuments français
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import CoreLocation

typealias AdresseCompletion = ( _ adresse: String?, _ erreur:String?) -> (Void)

class MonGeoCoder {
    
    
    static let obtenir = MonGeoCoder()
    
    func adresseDepuis(_ location: CLLocation, completion: AdresseCompletion?) {
        let codeur = CLGeocoder()
        codeur.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if let erreur = error {
                completion?(nil, erreur.localizedDescription)
            } else if let array = placemarks, array.count > 0 {
                let monPositionnement = array.last
                let numero = monPositionnement?.subThoroughfare ?? ""
                let rue = monPositionnement?.thoroughfare ?? ""
                let ville = monPositionnement?.locality ?? ""
                let adresse = numero + " " + rue + ", " + ville
                completion?(adresse, nil)
            } else {
                completion?(nil, "Une erreur est survenue")
            }
        })
    }
}
