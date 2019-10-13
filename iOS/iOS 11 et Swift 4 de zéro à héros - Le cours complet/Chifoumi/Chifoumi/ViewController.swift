//
//  ViewController.swift
//  Chifoumi
//
//  Created by damien on 21/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var resultatLabel: UILabel!
    @IBOutlet weak var resultatImageView: UIImageView!
    @IBOutlet weak var pierreBouton: UIButton!
    @IBOutlet weak var feuilleBouton: UIButton!
    @IBOutlet weak var ciseauxBouton: UIButton!
    
    var jukeBox: AVAudioPlayer?
    var boutons = [UIButton]()
    var chronometre: Timer?
    var images = [#imageLiteral(resourceName: "pierre"), #imageLiteral(resourceName: "feuille"), #imageLiteral(resourceName: "ciseaux")]
    var dictionnaire : [String: UIImage] = ["pierre": #imageLiteral(resourceName: "pierre"), "feuille": #imageLiteral(resourceName: "feuille"), "ciseaux": #imageLiteral(resourceName: "ciseaux")]
    
    var gagne = "C'est gagné : "
    var perdu = "C'est perdu : "
    var matchNul = "C'est un match null"
    
    var pierreCiseaux = "la pierre casse les ciseaux"
    var ciseauxFeuille = "les ciseaux coupent la feuille"
    var feuillePierre = "la feuille recouvre la pierre"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boutons = [pierreBouton, feuilleBouton, ciseauxBouton]
    }
    
    func jouerSon(nom: String, ext: String, repetition: Int) {
        let bundle = Bundle.main
        if let son = bundle.url(forResource: nom, withExtension: ext) {
        
        do {
            jukeBox = try AVAudioPlayer(contentsOf: son)
            jukeBox?.numberOfLoops = repetition
            jukeBox?.prepareToPlay()
            jukeBox?.play()
        } catch {
            print(error.localizedDescription)
        }
        }
    }
    
    @IBAction func pierreBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "pierre")
        disponibiliteDesBoutons(dispo: false, boutonChoisi: pierreBouton)
    }
    
    @IBAction func feuilleBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "feuille")
        disponibiliteDesBoutons(dispo: false, boutonChoisi: feuilleBouton)
    }
    
    @IBAction func ciseauxBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "ciseaux")
        disponibiliteDesBoutons(dispo: false, boutonChoisi: ciseauxBouton)
    }
    
    func lancerChronometre(choix: String) {
        
        resultatLabel.text = ""
        jouerSon(nom: "tictac", ext: "mp3", repetition: -1)
        var nombreDeTours = 0
    
        chronometre = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (chrono) in
            if nombreDeTours < 10 {
                UIView.transition(with: self.resultatImageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                    self.resultatImageView.image = self.imageAleatoire()
                }, completion: nil)
                //self.resultatImageView.image = self.imageAleatoire()
                nombreDeTours += 1
            } else {
                self.chronometre?.invalidate()
                self.jukeBox?.stop()
                if self.dictionnaire[choix] == self.resultatImageView.image {
                    self.resultatLabel.text = self.matchNul
                    //self.jouerSon(nom: "good", ext: "wav", repetition: 1)
                } else {
                    switch self .dictionnaire[choix] {
                    case #imageLiteral(resourceName: "pierre"):
                        if self.resultatImageView.image == #imageLiteral(resourceName: "ciseaux") {
                            self.resultatLabel.text = self.gagne + self.pierreCiseaux
                            self.jouerSon(nom: "good", ext: "wav", repetition: 1)
                        } else {
                            self.resultatLabel.text = self.perdu + self.feuillePierre
                            self.jouerSon(nom: "wrong", ext: "wav", repetition: 1)
                        }
                    case #imageLiteral(resourceName: "feuille"):
                        if self.resultatImageView.image == #imageLiteral(resourceName: "pierre") {
                            self.resultatLabel.text = self.gagne + self.feuillePierre
                            self.jouerSon(nom: "good", ext: "wav", repetition: 1)
                        } else {
                            self.resultatLabel.text = self.perdu + self.ciseauxFeuille
                            self.jouerSon(nom: "wrong", ext: "wav", repetition: 1)
                        }
                    case #imageLiteral(resourceName: "ciseaux"):
                        if self.resultatImageView.image == #imageLiteral(resourceName: "feuille") {
                            self.resultatLabel.text = self.gagne + self.ciseauxFeuille
                            self.jouerSon(nom: "good", ext: "wav", repetition: 1)
                        } else {
                            self.resultatLabel.text = self.perdu + self.pierreCiseaux
                            self.jouerSon(nom: "wrong", ext: "wav", repetition: 1)
                        }
                    default:  break
                    }
                    //self.resultatLabel.text = "C'est perdu"
                    //self.jouerSon(nom: "wrong", ext: "wav", repetition: 1)
                }
                self.disponibiliteDesBoutons(dispo: true, boutonChoisi: nil)
            }
        })
    }
    
    func imageAleatoire() -> UIImage {
        let aleatoireInt = Int(arc4random_uniform(UInt32(3)))
        return images[aleatoireInt]
    }
    
    func disponibiliteDesBoutons(dispo: Bool, boutonChoisi: UIButton?) {
        
        if dispo {
            for bouton in boutons {
                bouton.isUserInteractionEnabled = true
                bouton.alpha = 1
            }
        } else {
            guard let choix = boutonChoisi else { return}
            for bouton in boutons {
                bouton.isUserInteractionEnabled = false
                if bouton != choix {
                    bouton.alpha = 0.33
                }
            }
        }
    }
    
    //override var supportedInterfaceOrientations: UIInterfaceOrientationMask { get { return .all } }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.all
//    }
}

