//
//  Extensions.swift
//  CodabeeMeteo
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import Foundation

extension Double {
    
    func convertirEnIntString() -> String {
        let int = Int(self)
        return String(int) + " ºC"
    }
}
