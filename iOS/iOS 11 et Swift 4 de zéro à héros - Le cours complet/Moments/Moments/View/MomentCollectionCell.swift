//
//  MomentCollectionCell.swift
//  Moments
//
//  Created by damien on 02/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class MomentCollectionCell: UICollectionViewCell {


    @IBOutlet weak var imageViewCell: ImageCoinArrondi!
    
    var photo: Photo!
    
    func mep(_ photo: Photo) {
        self.photo = photo
        
        imageViewCell.image = self.photo.image
    }
}
