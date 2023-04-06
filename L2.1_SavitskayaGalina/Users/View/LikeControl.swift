//
//  LikeControl.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 02.05.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet var likePicture: UIImageView!
    
    var isLike: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }

}
