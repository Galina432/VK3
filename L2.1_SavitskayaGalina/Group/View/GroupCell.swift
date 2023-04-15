//
//  GroupCell.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 22.04.2022.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var groupImageView2: UIImageView!
    @IBOutlet weak var groupNameLabel2: UILabel!
    
    func configure(group: GroupViewModel) {
        groupNameLabel.text = group.nameText
        if let imgUrl = URL(string: group.avatarImageUrl) {
            groupImageView.load(url: imgUrl)
        }
    }
    
    func configure2(group: GroupViewModel) {
        groupNameLabel2.text = group.nameText
        if let imgUrl = URL(string: group.avatarImageUrl) {
            groupImageView2.load(url: imgUrl)
        }
    }
}
