//
//  ConnectionController.swift
//  CodaBook
//
//  Created by damien on 20/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import FirebaseAuth
class ConnectionController: UIViewController {

    
    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var mdpTF: UITextField!
    @IBOutlet weak var connectionBouton: BoutonCodaBook!
    @IBOutlet weak var pasDeCompteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cacherClavier)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cacher(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let id = Auth.auth().currentUser?.uid {
            // verifier su utilisateur dans BDD
            verifierUtilisateur(id: id)
            // passer à l'app
        } else {
           cacher(false)
        }
    }
    
    func cacher(_ bool: Bool) {
        titreLabel.isHidden = bool
        mailTF.isHidden = bool
        mdpTF.isHidden = bool
        connectionBouton.isHidden = bool
        pasDeCompteLabel.isHidden = bool
    }
    
    @objc func cacherClavier() {
        view.endEditing(true)
    }
    
    func completion(_ user: AuthDataResult?,_ error: Error?) {
        if let erreur = error {
            let nsErreur = erreur as NSError
            if nsErreur.code == 17011 {
                // créer utilisateur
                Auth.auth().createUser(withEmail: mailTF.text!, password: mdpTF.text!, completion: completion(_:_:))
            } else {
                Alerte.alerte.erreur(message: nsErreur.convertirErreurFirebaseEnString(), controller: self)
            }
        }
        
        if let utilisateur = user?.user {
            // Vérifier si l'utilisateur est dans la base de données
            //Alerte.alerte.erreur(message: "Utilisateur créé dans auth", controller: self)
            verifierUtilisateur(id: utilisateur.uid)
        }
    }
    
    func verifierUtilisateur(id: String) {
        let referenceFirebase = Refs.obtenir.baseUtilisateur.child(id)
        referenceFirebase.observe(.value) { (snapshot) in
            if snapshot.exists() {
                // passer à l'app
            } else {
                
            }
        }
    }
    
    func alerteTF(titre: String, message: String, array: [String], controller: UIViewController) {
        let alerte = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        
        for a in array {
            alerte.addTextField { (textefield) in
                textefield.placeholder = a
            }
        }
        
        let ok = UIAlertAction(title: OK, style: .default) { (action) in
            var dict: [String: String] = [:]
            
            for x in (0 ... array.count) {
                
            }
        }
    }
    
    @IBAction func connectionAction(_ sender: Any) {
        self.view.endEditing(true)
        if let adresse = mailTF.text, adresse != "" {
            if let mdp = mdpTF.text, mdp != "" {
                Auth.auth().signIn(withEmail: adresse, password: mdp, completion: completion(_:_:))
            } else {
                Alerte.alerte.erreur(message: MDP_VIDE, controller: self)
            }
        } else {
            Alerte.alerte.erreur(message: ADRESSE_VIDE, controller: self)
        }
    }
    

}
