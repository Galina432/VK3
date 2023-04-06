//
//  NewsTableViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 05.05.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {

//    var newNews = [
//    News(image: UIImage(named: "postDepp"), name: "Петрозаводская губа Онежского озера уже открылась ото льда, только вдоль берега местами еще лежит снег", avatarImage: UIImage(named: "depp"), avatarName: "Депп Джони"),
//    News(image: UIImage(named: "postRemont"), name: "Детская комната для маленькой принцессы. Очень красивые и нежные оттенки розового", avatarImage: UIImage(named: "remont"), avatarName: "Школа ремонта"),
//    News(image: UIImage(named: "postAlba"), name: "Пионы как отдельный вид искусства", avatarImage: UIImage(named: "alba"), avatarName: "Альба Джессика")
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        tableView.register(UINib(nibName: "NewsXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsXIBTableViewCell")
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return newNews.count
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsXIBTableViewCell", for: indexPath) as? NewsXIBTableViewCell else {
//            preconditionFailure("Error cell")
//        }
//        cell.postImageView.image = newNews[indexPath.row].image
//        cell.postTextLabel.text = newNews[indexPath.row].name
//        cell.postAvatarImage.image = newNews[indexPath.row].avatarImage
//        cell.postAvatarLabel.text = newNews[indexPath.row].avatarName
//
//        return cell
//    }
}
