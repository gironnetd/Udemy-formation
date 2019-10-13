//
//  ImageArrondie.swift
//  Repertoire d'entreprises
//
//  Created by damien on 05/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class ImageArrondie: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }

    func miseEnPlace() {
        layer.cornerRadius = frame.width / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        image = #imageLiteral(resourceName: "vador")
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
