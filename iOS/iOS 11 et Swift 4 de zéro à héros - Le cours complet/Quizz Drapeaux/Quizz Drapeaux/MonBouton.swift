//
//  MonBouton.swift
//  Quizz Drapeaux
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MonBouton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace() {
        tintColor = UIColor.white
        backgroundColor = UIColor.lightGray
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3
    }
}
