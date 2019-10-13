//
//  MealView.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 25/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MealView: UIView {

    var typeMeal: UILabel?
    var imageMeal: UIImageView?
    var descMeal: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initMeal(meal: Meal) {
        typeMeal = UILabel(frame: CGRect(x: 20, y: 0, width: frame.width - 40, height: 50))
        typeMeal?.text = convertTypeToMeal(type: meal.type)
        typeMeal?.textAlignment = .left
        typeMeal?.font = BASE_FONT
        typeMeal?.textColor = LIGHT_GRAY
        guard typeMeal != nil else { return }
        addSubview(typeMeal!)
        var maxY = typeMeal!.frame.maxY
        
        imageMeal = UIImageView(frame: CGRect(x: 0, y: maxY, width: frame.width, height: 200))
        imageMeal?.image = meal.image
        imageMeal?.contentMode = .scaleAspectFill
        imageMeal?.clipsToBounds = true
        guard imageMeal != nil else { return }
        addSubview(imageMeal!)
        maxY = imageMeal!.frame.maxY
        
        descMeal = UILabel(frame: CGRect(x: 20, y: maxY, width: frame.width - 40, height: 100))
        descMeal?.numberOfLines = 0
        descMeal?.text = meal.desc
        descMeal?.font = BASE_FONT
        descMeal?.textColor = LIGHT_GRAY
        descMeal?.textAlignment = .center
        guard descMeal != nil else { return }
        addSubview(descMeal!)
    }
    
    func convertTypeToMeal(type: Type) -> String {
        switch type {
        case .entree: return "Entrée"
        case .maindish: return "Plat principal"
        case .dessert: return "Dessert"
        }
    }

}
