//
//  PhotoController.swift
//  Patager les moments
//
//  Created by damien on 04/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    
    @IBOutlet weak var partagerBouton: UIBarButtonItem!
    @IBOutlet weak var imageAPartager: UIImageView!
    @IBOutlet weak var texteAPartager: UITextView!
    
    let texteVide = "Entrez un texte ..."
    
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlace()
    }
    
    func miseEnPlace() {
        
        imageAPartager.contentMode = .scaleAspectFit
        imageAPartager.image = #imageLiteral(resourceName: "Superman-facebook.svg")
        imageAPartager.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(prendrePhoto))
        imageAPartager.addGestureRecognizer(tap)
        
        texteAPartager.text = texteVide
        texteAPartager.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.allowsEditing = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var image: UIImage?
        
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editee
        } else if let originale = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originale
        }
        
        imageAPartager.image = image
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    @objc func prendrePhoto() {
        
        guard imagePicker != nil else { return }
        
        let alerte = UIAlertController(title: "Prendre photo ?", message: "choisir le média", preferredStyle: .actionSheet)
        
        let appareil = UIAlertAction(title: "Appareil Photo", style: .default) { (act) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker?.sourceType = .camera
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        
        let librairie = UIAlertAction(title: "Librairie de photos", style: .default) { (act) in
            self.imagePicker?.sourceType = .photoLibrary
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        
        let annuler = UIAlertAction(title: "annuler", style: .cancel, handler: nil)
        
        alerte.addAction(appareil)
        alerte.addAction(librairie)
        alerte.addAction(annuler)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let pop = alerte.popoverPresentationController {
                pop.sourceView = self.view
                pop.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
                pop.permittedArrowDirections = []
            }
        }
        self.present(alerte, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == texteVide {
            textView.text = ""
        }
    }
    
    @IBAction func boutonPartagerAppuye(_ sender: Any) {
        
        var contenuAPartager: [Any] = [Any]()
        
        if let image = imageAPartager.image, imageAPartager.image != #imageLiteral(resourceName: "Superman-facebook.svg") {
            contenuAPartager.append(image)
        }
        
        if texteAPartager.text != "", texteAPartager.text != texteVide {
            contenuAPartager.append(texteAPartager.text)
        }
        
        let activity = UIActivityViewController(activityItems: contenuAPartager, applicationActivities: nil)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let pop = activity.popoverPresentationController {
                pop.sourceView = self.view
                pop.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
                pop.permittedArrowDirections = []
            }
        }
        
        //self.present(activity, animated: true, completion: nil)
        self.present(activity, animated: true) {
            self.miseEnPlace()
        }
    }
}






