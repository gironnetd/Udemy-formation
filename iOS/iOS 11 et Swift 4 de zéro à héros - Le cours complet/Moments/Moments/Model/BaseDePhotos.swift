//
//  BaseDePhotos.swift
//  Moments
//
//  Created by damien on 02/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class BaseDePhotos {
    
    static let charger = BaseDePhotos()
    
    func toutesLesPhotos() -> [Photo] {
        
        var photos = [Photo]()
        
        photos.append(Photo(image: #imageLiteral(resourceName: "aurore boréale"), nom: "Gérard", desc: "Aurore Boréale"))
        photos.append(Photo(image: #imageLiteral(resourceName: "coucher de soleil"), nom: "Stéphanie", desc: "Coucher de soleil"))
        photos.append(Photo(image: #imageLiteral(resourceName: "dans ma rue"), nom: "Bruno", desc: "Dans ma rue"))
        photos.append(Photo(image: #imageLiteral(resourceName: "mes apps"), nom: "Laure", desc: "Mes applications faites sur Codabee.com"))
        photos.append(Photo(image: #imageLiteral(resourceName: "mon bureau"), nom: "Yannis", desc: "Mon bureau"))
        photos.append(Photo(image: #imageLiteral(resourceName: "paris"), nom: "Sébastien", desc: "Paris sera toujours Paris"))
        photos.append(Photo(image: #imageLiteral(resourceName: "steve scrabble"), nom: "Timothée", desc: "Steve J. était il bon au scrabble?"))
        photos.append(Photo(image: #imageLiteral(resourceName: "suis moi"), nom: "Jean-Jacques", desc: "Je te suivrai n'importe où"))
        photos.append(Photo(image: #imageLiteral(resourceName: "un ananas à la mer"), nom: "Patrick", desc: "La maison de bob l'éponge s'est échouée"))
        
        return photos
    }
}
