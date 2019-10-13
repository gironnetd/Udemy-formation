//
//  BoutonCodaBook.swift
//  CodaBook
//
//  Created by damien on 20/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class BoutonCodaBook: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace() {
        backgroundColor = UIColor.white
        tintColor = BLEU_CODABOOK
        layer.mep(10)
    }

}
