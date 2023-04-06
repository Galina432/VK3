//
//  NewsTableViewCell1.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 22.10.2022.
//

import UIKit
import Foundation


class NewsTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var newsAvatarPost: UIImageView!
    @IBOutlet weak var newsNamePost: UILabel!
    @IBOutlet weak var newsDatePost: UILabel!
    
    func config(name: String, imageURL: String, datePublication: Double) {
        
        self.newsNamePost.text = name
        
        //Фото профиля
        if let url = URL(string: imageURL) {
            let data = try? Data(contentsOf: url)
            
            self.newsAvatarPost.image = UIImage(data: data!)
        }
        //Дата

        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: datePublication)
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+3")
        
        self.newsDatePost.text = dateFormatter.string(from: date)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsAvatarPost.layer.cornerRadius = newsAvatarPost.bounds.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
