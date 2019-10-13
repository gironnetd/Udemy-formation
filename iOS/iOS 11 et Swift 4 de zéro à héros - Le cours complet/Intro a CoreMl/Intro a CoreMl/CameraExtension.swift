//
//  CameraExtension.swift
//  Intro a CoreMl
//
//  Created by damien on 18/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import AVFoundation

extension ViewController: AVCapturePhotoCaptureDelegate {
    
    func miseEnplaceCamera() {
        captureVideoPreviewLayer?.removeFromSuperlayer()
        captureSession = AVCaptureSession()
        
        if captureSession != nil {
            if let appareil = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: position) {
                do {
                    let input = try AVCaptureDeviceInput(device: appareil)
                    if captureSession!.canAddInput(input) {
                        captureSession?.addInput(input)
                        capturePhotoOutput = AVCapturePhotoOutput()
                        if capturePhotoOutput != nil {
                            if captureSession!.canAddOutput(capturePhotoOutput!) {
                                captureSession!.addOutput(capturePhotoOutput!)
                                captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                                captureVideoPreviewLayer?.videoGravity = .resizeAspectFill
                                captureVideoPreviewLayer?.connection?.videoOrientation = .portrait
                                
                                if captureVideoPreviewLayer != nil {
                                    captureVideoPreviewLayer?.frame = cameraVue.bounds
                                    cameraVue.layer.addSublayer(captureVideoPreviewLayer!)
                                    cameraVue.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(prendrePhoto)))
                                    captureSession?.startRunning()
                                }
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil {
            if let data = photo.fileDataRepresentation() {
                photoChoisiImageVue.image = UIImage(data: data)
                requete(data: data)
            } else {
                print("Le résultat ne donne pas de data")
            }
        } else {
            print(error!.localizedDescription)
        }
    }
    
    @objc func prendrePhoto() {
        if capturePhotoOutput != nil {
            capturePhotoOutput?.capturePhoto(with: obtenirReglages(), delegate: self)
        }
    }
    
    func obtenirReglages() -> AVCapturePhotoSettings {
        
        let reglages = AVCapturePhotoSettings()
        reglages.previewPhotoFormat = reglages.embeddedThumbnailPhotoFormat
        
        return reglages
    }
    
    
    
    
    
    
    
}
