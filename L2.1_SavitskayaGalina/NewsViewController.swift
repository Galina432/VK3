//
//  NewsViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 22.10.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
}
                            
//UITableViewDelegate {
//
//    private let newsfeedServise = NewsfeedService()
//
//    @IBOutlet var tableView: UITableView! {
//        didSet {
//            tableView.dataSource = self
//            tableView.delegate = self
//        }
//    }
////
//
////    var newsPostNews = [
////        NewsPost(newsAvatarPost: UIImage.init(systemName: "scissors")!, newsNamePost: "ktjybl", newsDatePost: "jjjkkkll"),
////        NewsPost(newsAvatarPost: UIImage.init(systemName: "scissors")!, newsNamePost: "irina", newsDatePost: "ddmmgggg")
////    ]
////
////    var newsTextPost = [
////    NewsTextPost(newsText: "Сегодня двадцать пятое ноября две тысячи восьмого года. Вторник.")
////    ]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.title = "Новости"
//        newsfeedServise.getFeed()
//
//    }
//
//}
//
////extension NewsViewController: UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        1
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        <#code#>
////    }
//
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        newsPostNews.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////
////
////        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell1", for: indexPath) as! NewsTableViewCell1
////
////        let object = newsPostNews[indexPath.row]
////        cell.set(object: object)
////
////        return cell
////
////        let cell2 = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell2", for: indexPath) as! NewsTableViewCell2
////
////        let object2 = newsTextPost[indexPath.row]
////        cell2.set2(object: object2)
////
////        return cell2
////    }
////
////
//}
