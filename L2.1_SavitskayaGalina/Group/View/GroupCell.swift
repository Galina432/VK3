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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
