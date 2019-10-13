//
//  LibrarieExtension.swift
//  Intro a CoreMl
//
//  Created by damien on 18/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoChoisiImageVue.image = image
            if let data = UIImagePNGRepresentation(image) {
                requete(data: data)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
