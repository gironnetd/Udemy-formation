//
//  ImagePickerExtension.swift
//  Repertoire d'entreprises
//
//  Created by damien on 06/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

extension AjoutController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func miseEnPlaceImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self
        imageDeProfil.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(prendrePhoto))
        imageDeProfil.addGestureRecognizer(tap)
    }
    
    @objc func prendrePhoto() {
        guard imagePicker != nil else {return}
        let alerte = UIAlertController(title: "Prendre photo", message: "Choissisez votre média", preferredStyle: .actionSheet)
        
        let appareil = UIAlertAction(title: "Ajouter une photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker?.sourceType = .camera
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        
        let librairie = UIAlertAction(title: "librairie", style: .default) { (action) in
            self.imagePicker?.sourceType = .photoLibrary
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        
        let annuler = UIAlertAction(title: "Annuler", style: .destructive, handler: nil)
        
        alerte.addAction(appareil)
        alerte.addAction(librairie)
        alerte.addAction(annuler)
        
        self.present(alerte, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage{
            image = editee
        } else if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = original
        }
        
        imageDeProfil.image = image
        imagePicker?.dismiss(animated: true, completion: nil)
    }
}
