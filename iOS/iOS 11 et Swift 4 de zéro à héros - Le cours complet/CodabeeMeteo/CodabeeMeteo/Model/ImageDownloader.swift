//
//  ImageDownloader.swift
//  CodabeeMeteo
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    static let obtenir = ImageDownloader()
    
    func imageDepuis(_ string: String, _ imageView: UIImageView) {
        let baseUrl = "http://openweathermap.org/img/w/"
        let ext = ".png"
        if let url = URL(string: baseUrl + string + ext) {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                guard data != nil, let image = UIImage(data: data!) else { return}
                DispatchQueue.main.async {
                    imageView.image = image
                }
            })
            task.resume()
        }
    }
}
