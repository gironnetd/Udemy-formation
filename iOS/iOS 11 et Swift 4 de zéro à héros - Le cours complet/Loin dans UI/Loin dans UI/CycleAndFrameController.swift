//
//  CycleAndFrameController.swift
//  Loin dans UI
//
//  Created by damien on 24/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class CycleAndFrameController: UIViewController {

    
    @IBOutlet weak var viewFrameAndBounds: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("function viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("function viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("function viewDidAppear")
        print("Frame: -> \(viewFrameAndBounds.frame)")
        print("Bounds: -> \(viewFrameAndBounds.bounds)")
        UIView.animate(withDuration: 2, animations: {
            self.viewFrameAndBounds.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) / 82)
        }) { (success) in
            print("Frame: -> \(self.viewFrameAndBounds.frame)")
            print("Bounds: -> \(self.viewFrameAndBounds.bounds)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("function viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("function viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("function didReceiveMemoryWarning")

        // Dispose of any resources that can be recreated.
    }
}
