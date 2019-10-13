//
//  DetailController.swift
//  MonRestaurantDuMonde
//
//  Created by damien on 25/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(Degraded())
        view.bringSubview(toFront: scrollView)
        
        guard menu != nil else { return }
        initDetail(menu: menu!)
    }
    
    func initDetail(menu: Menu) {
        let imageDuMenu = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        imageDuMenu.image = menu.image
        imageDuMenu.contentMode = .scaleAspectFill
        imageDuMenu.clipsToBounds = true
        scrollView.addSubview(imageDuMenu)
        var maxY = imageDuMenu.frame.maxY
        
        let nomDuMenu = UILabel(frame: CGRect(x: 0, y: maxY, width: view.frame.width, height: 100))
        nomDuMenu.text = "Menu " + menu.country
        nomDuMenu.font = TITLE_FONT
        nomDuMenu.textColor = .red
        nomDuMenu.adjustsFontSizeToFitWidth = true
        nomDuMenu.textAlignment = .center
        scrollView.addSubview(nomDuMenu)
        maxY = nomDuMenu.frame.maxY
        
        for meal in menu.meals {
            let view = MealView(frame: CGRect(x: 0, y: maxY, width: self.view.frame.width, height: 375))
            view.initMeal(meal: meal)
            scrollView.addSubview(view)
            maxY = view.frame.maxY
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: maxY + 50)
        
    }
}
