//
//  ViewController.swift
//  CameraFilter
//
//  Created by damien on 10/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {

    @IBOutlet weak var applyFilterButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nav = segue.destination as? UINavigationController,
            let photosCollectionViewController = nav.viewControllers.first as? PhotosCollectionViewController
        else {
            fatalError("Segue Destination not Found")
        }
        
        photosCollectionViewController.selectedPhoto.subscribe (onNext: { [weak self] image in
            
            DispatchQueue.main.async {
                self?.updateUI(with: image)
            }
        }).disposed(by: disposeBag)
    }
    
    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.applyFilterButton.isHidden = false
    }
    
    @IBAction func applyFilterButtonPressed() {
        
        guard let sourceImage = self.photoImageView.image else { return }
        
        FilterService().applyFilter(to: sourceImage).subscribe(onNext: { filteredImage in
            DispatchQueue.main.async {
                self.photoImageView.image = filteredImage
            }
        }).disposed(by: disposeBag)
    }
}

