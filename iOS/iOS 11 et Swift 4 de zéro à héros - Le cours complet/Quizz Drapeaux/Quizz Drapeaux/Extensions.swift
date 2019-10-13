//
//  Extensions.swift
//  Quizz Drapeaux
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

extension UILabel {
    
    func miseAJour(_ questionActuelle: Int,_ score: Int) {
        let attributed = NSMutableAttributedString(string: "Question actuelle : \(questionActuelle) \n", attributes: [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 17)])
        attributed.append(NSAttributedString(string: "Score : \(score) / 10 \n", attributes: [.foregroundColor: UIColor.darkGray, .font: UIFont.italicSystemFont(ofSize: 17)]))
        self.attributedText = attributed
    }
}
