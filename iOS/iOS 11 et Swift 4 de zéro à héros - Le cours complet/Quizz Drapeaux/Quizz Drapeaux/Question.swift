//
//  Question.swift
//  Quizz Drapeaux
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class Question {
    
    private var _drapeau: UIImage
    private var _reponse1: String
    private var _reponse2: String
    private var _reponse3: String
    private var _reponse4: String
    private var _tagCorrect: Int
    
    var drapeau: UIImage {
        return _drapeau
    }
    
    var reponse1: String {
        return _reponse1
    }
    
    var reponse2: String {
        return _reponse2
    }
    
    var reponse3: String {
        return _reponse3
    }
    
    var reponse4: String {
        return _reponse4
    }
    
    var tagCorrect: Int {
        return _tagCorrect
    }
    
    init(drapeau: UIImage, reponse1: String, reponse2: String, reponse3: String, reponse4: String, tagCorrect: Int) {
        self._drapeau = drapeau
        self._reponse1 = reponse1
        self._reponse2 = reponse2
        self._reponse3 = reponse3
        self._reponse4 = reponse4
        self._tagCorrect = tagCorrect
    }
    
    
    
    
    
}
