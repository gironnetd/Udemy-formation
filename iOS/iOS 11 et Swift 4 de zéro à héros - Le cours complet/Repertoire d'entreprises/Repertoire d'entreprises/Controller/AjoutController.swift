//
//  AjoutController.swift
//  Repertoire d'entreprises
//
//  Created by damien on 05/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import CoreData

class AjoutController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageDeProfil: ImageArrondie!
    @IBOutlet weak var ajouterEntreprise: UIButton!
    @IBOutlet weak var prenomTextField: UITextField!
    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var ajouterPersonneBouton: BoutonArrondi!
    @IBOutlet weak var largeurContrainte: NSLayoutConstraint!
    @IBOutlet weak var contrainteDuBas: NSLayoutConstraint!
    
    var entreprises = [Entreprise]()
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceImagePicker()
        miseEnPlacePicker()
        fetchEntreprises()
        miseEnPlaceTextField()
        miseEnPlaceNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        largeurContrainte.constant = view.frame.width
        scroll.contentSize = CGSize(width: largeurContrainte.constant, height: scroll.frame.height)
    }
    
    func fetchEntreprises() {
        let request: NSFetchRequest<Entreprise> = Entreprise.fetchRequest()
        let tri = NSSortDescriptor(key: "nom", ascending: true)
        request.sortDescriptors = [tri]
        do {
            entreprises = try context.fetch(request)
            pickerView.reloadAllComponents()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func ajouterEntrepriseAction(_ sender: Any) {
        
        let alerte = UIAlertController(title: "Votre entreprise n'est pas dans la liste ?", message: "Ajouter", preferredStyle: .alert)
        
        let ajout = UIAlertAction(title: "Ok", style: .default) { (act) in
            let texteField = alerte.textFields![0] as UITextField
            if let text = texteField.text, text != "" {
                let nouvelleEntreprise = Entreprise(context: context)
                nouvelleEntreprise.nom = text
                appDelegate.saveContext()
                self.fetchEntreprises()
            }
        }
        
        let annuler = UIAlertAction(title: "Annuler", style: .default, handler: nil)
        
        alerte.addTextField { (tf) in
            tf.placeholder = "Nom de l'entreprise"
        }
        
        alerte.addAction(ajout)
        alerte.addAction(annuler)
        
        
        
        self.present(alerte, animated: true, completion: nil)
    }
    
    @IBAction func ajouterPersonneAction(_ sender: Any) {
        view.endEditing(true)
        
        let nouvellePersonne = Personne(context: context)
        
        if prenomTextField.text != nil {
            nouvellePersonne.prenom = prenomTextField.text!
        }
        
        if nomTextField.text != nil {
            nouvellePersonne.nom = nomTextField.text!
        }
        
        if let numero = telTextField.text, let numeroInt = Int32(numero) {
            nouvellePersonne.numero = numeroInt
        }
        
        if mailTextField.text != nil {
            nouvellePersonne.mail = mailTextField.text!
        }
        nouvellePersonne.photo = imageDeProfil.image
        nouvellePersonne.employeur = entreprises[pickerView.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
}






