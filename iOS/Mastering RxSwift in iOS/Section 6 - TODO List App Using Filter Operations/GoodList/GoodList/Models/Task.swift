//
//  Task.swift
//  GoodList
//
//  Created by damien on 17/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
    
}
