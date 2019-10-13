//
//  MenuCell.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var nameMenu: UILabel!
    
    var menu: Menu?
    
    func initMenu(menu: Menu) {
        self.menu = menu
        
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = BLACK.cgColor
        
        imageMenu.image = self.menu?.image
        imageMenu.layer.cornerRadius = imageMenu.frame.width / 2
        imageMenu.contentMode = .scaleAspectFill
        imageMenu.clipsToBounds = true
        imageMenu.layer.borderWidth = 2
        imageMenu.layer.borderColor = LIGHT_GRAY.cgColor
        
        nameMenu.text = "Menu " + self.menu!.country
        nameMenu.textColor = DARK_GRAY
        nameMenu.font = BASE_FONT
        nameMenu.adjustsFontSizeToFitWidth = true
        nameMenu.textAlignment = .center
        
        
    }
}
