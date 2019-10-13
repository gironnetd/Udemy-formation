//
//  ProgrammaticallyController.swift
//  Loin dans UI
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class ProgrammaticallyController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var myFirstUIView: UIView?
    var myFirstUILabel: UILabel?
    var myFirstUIButton: UIButton?
    var myFirstUIImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFirstUIView = UIView(frame: CGRect(x: 30, y: 60, width: 200, height: 50))
        myFirstUIView?.backgroundColor = UIColor(red: 30 / 255, green: 123 / 255, blue: 90 / 255, alpha: 1)
        myFirstUIView?.layer.cornerRadius = 25
        guard myFirstUIView != nil else { return }
        scrollView.addSubview(myFirstUIView!)
        
        myFirstUILabel = UILabel(frame: CGRect(x: 0, y: myFirstUIView!.frame.maxY + 20, width: view.frame.width, height: 50))
        myFirstUILabel?.text = "Salut, I am here"
        myFirstUILabel?.numberOfLines = 1
        myFirstUILabel?.textColor = UIColor.white
        myFirstUILabel?.font = UIFont(name: "Chalkduster", size: 20)
        myFirstUILabel?.textAlignment = .center
        scrollView.addSubview(myFirstUILabel!)
        
        myFirstUIButton = UIButton(frame: CGRect(x: view.frame.width / 2 - 75, y: myFirstUILabel!.frame.maxY + 220, width: 150, height: 40))
        myFirstUIButton?.setTitle("Push", for: .normal)
        myFirstUIButton?.layer.borderWidth = 2
        myFirstUIButton?.backgroundColor = UIColor.darkGray
        myFirstUIButton?.layer.borderColor = UIColor.white.cgColor
        myFirstUIButton?.tintColor = UIColor.blue
        myFirstUIButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        scrollView.addSubview(myFirstUIButton!)
        myFirstUIButton?.addTarget(self, action: #selector(boutonAppuye), for: .touchUpInside)
        
        let width = view.frame.width - 60
        let rect = CGRect(x: 30, y: view.frame.height / 2 - (width / 2), width: width, height: width)
        myFirstUIImageView = UIImageView(frame: rect)
        myFirstUIImageView?.image = #imageLiteral(resourceName: "logo")
        myFirstUIImageView?.contentMode = .scaleAspectFill
        myFirstUIImageView?.clipsToBounds = true
        myFirstUIImageView?.layer.cornerRadius = myFirstUIImageView!.frame.width / 2
        
        scrollView.addSubview(myFirstUIImageView!)
        //view.sendSubview(toBack: myFirstUIImageView!)
        scrollView.bringSubview(toFront: myFirstUIButton!)

        myFirstUIImageView?.isUserInteractionEnabled = true
        myFirstUIImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageAppuye)))
    
        let colors: [UIColor] = [.red, .blue, .white, .black]
        var maximum: CGFloat = myFirstUIImageView!.frame.maxY
        
        for color in colors {
            let view = UIView(frame: CGRect(x: 0, y: maximum + 10, width: 100, height: 100))
            view.backgroundColor = color
            scrollView.addSubview(view)
            maximum = view.frame.maxY
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width * 2, height: maximum + 100)
    }
    
    @objc func imageAppuye() {
        print("image touché")
    }
    
    @objc func boutonAppuye() {
        print("bouton appuyé")
    }
}
