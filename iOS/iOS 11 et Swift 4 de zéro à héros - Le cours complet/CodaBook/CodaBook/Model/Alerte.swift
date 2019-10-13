//
//  Alerte.swift
//  CodaBook
//
//  Created by damien on 20/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Alerte {
    
    static let alerte = Alerte()
    
    func erreur(message: String, controller: UIViewController) {
       let alerte = UIAlertController(title: ERREUR, message: message, preferredStyle: .alert)
       alerte.addAction(UIAlertAction(title: OK, style: .default, handler: nil))
        controller.present(alerte, animated: true, completion: nil)
    }
}
