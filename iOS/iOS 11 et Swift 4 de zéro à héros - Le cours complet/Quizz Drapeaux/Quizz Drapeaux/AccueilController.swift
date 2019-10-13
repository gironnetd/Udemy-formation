//
//  AccueilController.swift
//  Quizz Drapeaux
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class AccueilController: UIViewController {

    @IBOutlet weak var meilleurScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quizz Drapeaux du Monde"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let meilleurScore = UserDefaults.standard.integer(forKey: "score")
        let scoreString = "Meilleur score : \(meilleurScore) / 10"
        meilleurScoreLabel.text = scoreString
    }
}
