//
//  Article.swift
//  GoodNews
//
//  Created by damien on 30/07/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
