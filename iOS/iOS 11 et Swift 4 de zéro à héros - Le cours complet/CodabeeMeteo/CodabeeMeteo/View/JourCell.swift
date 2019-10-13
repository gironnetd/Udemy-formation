//
//  JourCell.swift
//  CodabeeMeteo
//
//  Created by damien on 08/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class JourCell: UITableViewCell {
    
    @IBOutlet weak var icone: UIImageView!
    @IBOutlet weak var texte: UILabel!
    
    var jour: PrevisionJournaliere!
    
    func miseEnPlace(prevision: PrevisionJournaliere) {
        jour = prevision
        ImageDownloader.obtenir.imageDepuis(jour.icone, icone)
        let attributed = NSMutableAttributedString(string: jour.jour + "\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 22), .foregroundColor: UIColor.darkGray])
        let descString = NSAttributedString(string: jour.desc + "\n", attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let temperatures = NSAttributedString(string: "Min: " + jour.min.convertirEnIntString() + "  -  Max: " + jour.max.convertirEnIntString(), attributes: [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.black])
        attributed.append(descString)
        attributed.append(temperatures)
        texte.attributedText = attributed
    }
}
