//
//  MealCell.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var descMeal: UILabel!
    
    var meal: Meal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func initMeal(meal: Meal) {
        self.meal = meal
        
        imageMeal.image = self.meal?.image
        imageMeal.contentMode = .scaleAspectFill
        imageMeal.clipsToBounds = true
        imageMeal.layer.cornerRadius = 20
        
        descMeal.text = self.meal?.desc
        descMeal.textAlignment = .center
        descMeal.numberOfLines = 0
        descMeal.font = BASE_FONT
        descMeal.textColor = LIGHT_GRAY
    }
}
