//
//  ViewController.swift
//  Intro a CoreMl
//
//  Created by damien on 18/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var cameraVue: UIView!
    @IBOutlet weak var photoChoisiImageVue: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var librairie: UIButton!
    @IBOutlet weak var rotationBouton: UIButton!
    
    var captureSession: AVCaptureSession?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var position = AVCaptureDevice.Position.back
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnplaceCamera()
        rotationBouton.layer.cornerRadius = 5
        librairie.layer.cornerRadius = 5
        imagePicker.delegate = self
    }
    
    @IBAction func libraireAction(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func rotationAction(_ sender: Any) {
        switch position {
        case .front: position = .back
        case .back: position = .front
        case .unspecified: position = .back
        }
        miseEnplaceCamera()
    }
    
    
}

