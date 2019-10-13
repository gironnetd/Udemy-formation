//
//  Article.swift
//  GoodNews
//
//  Created by damien on 18/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7ac308f5b4a54397a738fae3d5103ce2")!
        return Resource<ArticlesList>(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
