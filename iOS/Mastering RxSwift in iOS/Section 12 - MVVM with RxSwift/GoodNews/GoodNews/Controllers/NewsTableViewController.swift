//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by damien on 18/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articlesViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesViewModel == nil ? 0: self.articlesViewModel.articlesViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        else {
                fatalError("ArticleTableViewCell not Found")
        }
        let articleViewModel = self.articlesViewModel.articleAt(indexPath.row)
        
        articleViewModel.title.asDriver(onErrorJustReturn: "")
        .drive(cell.titleLabel.rx.text)
        .disposed(by: disposeBag)
        
        articleViewModel.description.asDriver(onErrorJustReturn: "")
        .drive(cell.descriptionLabel.rx.text)
        .disposed(by: disposeBag)
        
        return cell
    }
    
    private func populateNews() {
        
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=7ac308f5b4a54397a738fae3d5103ce2")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articles = articleResponse.articles
                self.articlesViewModel = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
}
