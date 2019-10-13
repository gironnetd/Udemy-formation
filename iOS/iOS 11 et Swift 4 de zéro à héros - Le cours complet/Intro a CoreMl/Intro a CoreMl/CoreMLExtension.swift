//
//  CoreMLExtension.swift
//  Intro a CoreMl
//
//  Created by damien on 18/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import CoreML
import Vision

extension ViewController {
    
    func requete(data: Data) {
        
        do {
          let coreMLModel = try VNCoreMLModel(for: MobileNet().model)
          let requete = VNCoreMLRequest(model: coreMLModel, completionHandler: reponse)
          let requeteHandler = VNImageRequestHandler(data: data)
          try requeteHandler.perform([requete])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func reponse( _ request: VNRequest, _ erreur: Error?) {
        if let result = request.results as? [VNClassificationObservation] {
            let resultats = result.sorted(by: {$0.confidence > $1.confidence})
            if resultats.count > 0 {
    
                let meilleurResultat = resultats[0]
                let attributed = NSMutableAttributedString(string: meilleurResultat.identifier, attributes: [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.red])
                let int = Int(meilleurResultat.confidence * 100)
                let confianceString = "\n Confiance : " + String(int) + "%"
                attributed.append(NSMutableAttributedString(string: confianceString, attributes: [.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.black]))
                predictionLabel.attributedText = attributed
            }
            
            
//            for res in result {
//                print(res.identifier)
//                print(Int(res.confidence * 100))
//            }
        }
    }
}
