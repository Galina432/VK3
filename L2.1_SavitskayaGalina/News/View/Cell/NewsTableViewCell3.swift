//
//  NewsTableViewCell3.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 30.10.2022.
//

import UIKit


class NewsTableViewCell3: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView?
    
//    func configure(_ url: String) {
//        postImage.loadImage(url)
//    }
//
    func configure(_ image: UIImage?) {
        postImage?.image = image
    }
    
    func config(photoModel: String? = nil) {
        guard let photoModel = photoModel else {return}
        if let url = URL(string: photoModel) {
            let data = try? Data(contentsOf: url)
            postImage?.image = UIImage(data: data!)
            self.postImage?.layer.borderWidth = 0
            }
        }
}

