//
//  NewsTableViewCell2.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 23.10.2022.
//


import UIKit

class NewsTableViewCell2: UITableViewCell {
    
    var butttonClicked: (() -> (Void))!
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var buttonText: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func buttonTextFull(_ sender: Any) {
        butttonClicked()
    }
    
    func configure(_ text: String?) {
        postLabel.text = text
    }
}

