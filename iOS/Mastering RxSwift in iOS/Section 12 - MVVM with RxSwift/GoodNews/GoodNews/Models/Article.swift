//
//  Article.swift
//  GoodNews
//
//  Created by damien on 18/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
