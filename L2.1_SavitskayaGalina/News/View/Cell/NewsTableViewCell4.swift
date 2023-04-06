//
//  NewsTableViewCell4.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 15.01.2023.
//

import UIKit

class NewsTableViewCell4: UITableViewCell {

    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var repostLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config(numLike: Int, numComments: Int, numReposts: Int, numViews: Int ) {
        self.likesLabel.text = String (numLike)
        self.commentsLabel.text = String (numComments)
        self.repostLabel.text = String (numReposts)
        if numViews > 10000 {
            let num = numViews / 1000
            self.viewsLabel.text = String ("\(num)K")
        } else {
            self.viewsLabel.text = String (numViews)
        }
    }
}
