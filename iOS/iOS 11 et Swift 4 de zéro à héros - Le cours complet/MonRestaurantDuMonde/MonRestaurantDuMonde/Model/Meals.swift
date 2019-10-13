//
//  Meals.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Meals {
    
    static let get = Meals()
    
    func menus() -> [Menu] {
        var menus = [Menu]()
        let it = Menu(country: ITALY, image: #imageLiteral(resourceName: "pizza"))
        let jap = Menu(country: JAPAN, image: #imageLiteral(resourceName: "sushis"))
        let chi = Menu(country: CHINA, image: #imageLiteral(resourceName: "crevette aigre doux"))
        let usa = Menu(country: USA, image: #imageLiteral(resourceName: "burger"))
        let mex = Menu(country: MEXICA, image: #imageLiteral(resourceName: "fajitas"))
        let spa = Menu(country: SPANA, image: #imageLiteral(resourceName: "paella"))
        let sui = Menu(country: SWISS, image: #imageLiteral(resourceName: "fondue"))
        
        menus.append(contentsOf: [it, jap, chi, usa, mex, spa, sui])
        return menus
    }
    
    func completeCard() -> [Card] {
        let entree = Card(type: .entree)
        let plat = Card(type: .maindish)
        let dessert = Card(type: .dessert)
        return [entree, plat, dessert]
    }
    
    func atCards(type: Type) -> [Meal] {
        var meals = [Meal]()
        
        for meal in allTheMeals() {
            if meal.type == type {
                meals.append(meal)
            }
        }
        return meals
    }
    
    
    func addMealToMenu(country: String) -> [Meal] {
        var meals = [Meal]()
        
        for meal in allTheMeals() {
            if meal.country == country {
                meals.append(meal)
            }
        }
        return meals
    }
    
    func allTheMeals() -> [Meal] {
        var allMeals = [Meal]()
        
        let tomate = Meal(type: .entree, country: ITALY, desc: "Salade de tomates et Mozzarella", image: #imageLiteral(resourceName: "mozza"))
        allMeals.append(tomate)
        let pizza = Meal(type: .maindish, country: ITALY, desc: "Pizza Royale (jambon, fromage et champignons)", image: #imageLiteral(resourceName: "pizza"))
        allMeals.append(pizza)
        let tiramisu = Meal(type: .dessert, country: ITALY, desc: "Le fameux Tiramisu au café, un régal pour les papilles", image: #imageLiteral(resourceName: "tiramisu"))
        allMeals.append(tiramisu)
        
        let nuggets = Meal(type: .entree, country: USA, desc: "Nuggets de poulet", image: #imageLiteral(resourceName: "nuggets"))
        allMeals.append(nuggets)
        let burg = Meal(type: .maindish, country: USA, desc: "Cheeseburger avec viande 100% charolaise", image: #imageLiteral(resourceName: "burger"))
        allMeals.append(burg)
        let sundae = Meal(type: .dessert, country: USA, desc: "Sundae nappage chocolat et éclat de noix de pécan", image: #imageLiteral(resourceName: "sundae"))
        allMeals.append(sundae)
        
        let nems = Meal(type: .entree, country: CHINA, desc: "4 nems frits au poulet", image: #imageLiteral(resourceName: "nem"))
        allMeals.append(nems)
        let crevette = Meal(type: .maindish, country: CHINA, desc: "Crevettes sauce aigre douce, servie ave du riz cantonais", image: #imageLiteral(resourceName: "crevette aigre doux"))
        allMeals.append(crevette)
        let litchi = Meal(type: .dessert, country: CHINA, desc: "Cheesecake au litchi et citron yuzu", image: #imageLiteral(resourceName: "cheesecake citon litchi"))
        allMeals.append(litchi)
        
        let gaz = Meal(type: .entree, country: SPANA, desc: "Gazpacho: la soupe froide qui vient d'Andalousie", image: #imageLiteral(resourceName: "gazpacho"))
        allMeals.append(gaz)
        let paellas = Meal(type: .maindish, country: SPANA, desc: "La véritable paêlla valencianne", image: #imageLiteral(resourceName: "paella"))
        allMeals.append(paellas)
        let churro = Meal(type: .dessert, country: SPANA, desc: "Churros et crème de framboise", image: #imageLiteral(resourceName: "Churros et creme de framboise"))
        allMeals.append(churro)
        
        let sushi = Meal(type: .entree, country: JAPAN, desc: "Plateau de sushis variés (8 pièces)", image: #imageLiteral(resourceName: "sushis"))
        allMeals.append(sushi)
        let boeuf = Meal(type: .maindish, country: JAPAN, desc: "Boeuf Teryiaki", image: #imageLiteral(resourceName: "teriyaki"))
        allMeals.append(boeuf)
        let glace = Meal(type: .dessert, country: JAPAN, desc: "Glace au thé vert et Sésame", image: #imageLiteral(resourceName: "glace thé vert"))
        allMeals.append(glace)
        
        let nacho = Meal(type: .entree, country: MEXICA, desc: "Plat de nachos dorés au fromage fondu", image: #imageLiteral(resourceName: "nachos"))
        allMeals.append(nacho)
        let fajitas = Meal(type: .maindish, country: MEXICA, desc: "Fajitas boeuf ou poulet", image: #imageLiteral(resourceName: "fajitas"))
        allMeals.append(fajitas)
        let sop = Meal(type: .dessert, country: MEXICA, desc: "Sopapilla, un amour de beignet tout droit venu du Yucatan", image: #imageLiteral(resourceName: "sopapilla"))
        allMeals.append(sop)
        
        let char = Meal(type: .entree, country: SWISS, desc: "Plateau de charcuterie suisse", image: #imageLiteral(resourceName: "charcuterie"))
        allMeals.append(char)
        let fond = Meal(type: .maindish, country: SWISS, desc: "Fondue au fromage", image: #imageLiteral(resourceName: "fondue"))
        allMeals.append(fond)
        let gateau = Meal(type: .dessert, country: SWISS, desc: "Gateau au véritable chocolat Suisse", image: #imageLiteral(resourceName: "geateau au chocolat suisse"))
        allMeals.append(gateau)
        
        return allMeals
    }
}
