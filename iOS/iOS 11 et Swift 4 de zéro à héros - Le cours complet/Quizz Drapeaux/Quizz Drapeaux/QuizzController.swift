//
//  QuizzController.swift
//  Quizz Drapeaux
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class QuizzController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var drapeauxImageView: UIImageView!
    @IBOutlet weak var bouton1: MonBouton!
    @IBOutlet weak var bouton2: MonBouton!
    @IBOutlet weak var bouton3: MonBouton!
    @IBOutlet weak var bouton4: MonBouton!
    
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var popoImageView: UIImageView!
    @IBOutlet weak var popResultat: UILabel!
    @IBOutlet weak var popReponse: UILabel!
    @IBOutlet weak var popBouton: MonBouton!
    
    var questions = [Question]()
    var questionPosee: Question?
    var questionActuelle = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = peuplerQuestions()
        obtenirQuestion()
    }
    
    func peuplerQuestions() -> [Question] {
        var mesQuestions = [Question]()
        
        let france = Question(drapeau: #imageLiteral(resourceName: "fr"), reponse1: "France", reponse2: "Italie", reponse3: "Luxembourg", reponse4: "Irlande", tagCorrect: 1)
        let belgique = Question(drapeau:#imageLiteral(resourceName: "be"), reponse1: "Allemagne", reponse2: "Autriche", reponse3: "Cameroun", reponse4: "Belgique", tagCorrect: 4)
        let finlande = Question(drapeau: #imageLiteral(resourceName: "fi"), reponse1: "Suède", reponse2: "Finlande", reponse3: "Islande", reponse4: "Norvège", tagCorrect: 2)
        let grece = Question(drapeau: #imageLiteral(resourceName: "gr"), reponse1: "Australie", reponse2: "Etats-Unis", reponse3: "Grèce", reponse4: "Paraguay", tagCorrect: 3)
        let japon = Question(drapeau: #imageLiteral(resourceName: "jp"), reponse1: "Japon", reponse2: "Chine", reponse3: "Corée du Nord", reponse4: "Thaïlande", tagCorrect: 1)
        let mexique = Question(drapeau: #imageLiteral(resourceName: "mx"), reponse1: "Irlande", reponse2: "Mexique", reponse3: "Italie", reponse4: "Portugal", tagCorrect: 2)
        let paysBas = Question(drapeau: #imageLiteral(resourceName: "nl"), reponse1: "France", reponse2: "Serbie", reponse3: "Pays-Bas", reponse4: "Croatie", tagCorrect: 3)
        let portugal = Question(drapeau: #imageLiteral(resourceName: "pt"), reponse1: "Namibie", reponse2: "Ukraine", reponse3: "Iran", reponse4: "Portugal", tagCorrect: 4)
        let tunisie = Question(drapeau: #imageLiteral(resourceName: "tn"), reponse1: "Tunisie", reponse2: "Turquie", reponse3: "Maroc", reponse4: "Algérie", tagCorrect: 1)
        let uruguay = Question(drapeau: #imageLiteral(resourceName: "uy"), reponse1: "Argentine", reponse2: "Uruguay", reponse3: "Paraguay", reponse4: "Chili", tagCorrect: 2)
        
        mesQuestions.append(contentsOf: [france, belgique, finlande, grece,japon, mexique, paysBas, portugal, tunisie, uruguay])
        
        return mesQuestions
    }
    
    func obtenirQuestion() {
        if questionActuelle < 10 {
            questionActuelle += 1
            scoreLabel.miseAJour(questionActuelle, score)
            questionPosee = questions[questionActuelle - 1]
            if let question = questionPosee {
                drapeauxImageView.image = question.drapeau
                bouton1.setTitle(question.reponse1, for: .normal)
                bouton2.setTitle(question.reponse2, for: .normal)
                bouton3.setTitle(question.reponse3, for: .normal)
                bouton4.setTitle(question.reponse4, for: .normal)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let meilleurScore = UserDefaults.standard.integer(forKey: "score")
            if score > meilleurScore {
                UserDefaults.standard.set(score, forKey: "score")
                UserDefaults.standard.synchronize()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func montrerPopUp (gagne: Bool, pays: String, drapeau: UIImage) {
        popoImageView.image = drapeau
        popReponse.text = "La bonne réponse était : " + pays
        if gagne {
            popResultat.text = "Félicitations !!!"
        } else {
            popResultat.text = "Mauvaise réponse"
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.blur.alpha = 1
            self.popup.alpha = 1
        }) { (success) in
            //
        }
    }
    
    @IBAction func popBoutonAppuye(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blur.alpha = 0
            self.popup.alpha = 0
        }) { (success) in
            self.obtenirQuestion()
        }
    }
    
    @IBAction func boutonAppuye(_ sender: Any) {
        if let question = questionPosee, let bouton = sender as? UIButton {
            if question.tagCorrect == bouton.tag {
                //print("gagné")
                score += 1
                montrerPopUp(gagne: true, pays: bouton.titleLabel?.text ?? "", drapeau: question.drapeau)
            } else {
//                print("perdu")
                var pays: String?
                switch question.tagCorrect {
                case 1: pays = bouton1.titleLabel?.text
                case 2: pays = bouton2.titleLabel?.text
                case 3: pays = bouton3.titleLabel?.text
                case 4: pays = bouton4.titleLabel?.text
                default : break
                }
                montrerPopUp(gagne: false, pays: pays ?? "", drapeau: question.drapeau)
            }
            //obtenirQuestion()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
