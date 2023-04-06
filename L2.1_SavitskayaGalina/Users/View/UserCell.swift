//
//  UserCell.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 24.04.2022.
//

import UIKit

class UserCell: UITableViewCell {


    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = userImageView.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_ : )))
        userImageView.addGestureRecognizer(tapGesture)
        userImageView.isUserInteractionEnabled = true
    }
        
    @objc func tapOnImage(_ sender:UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 20,
                       options: .curveEaseInOut) {
            self.userImageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        userImageView.transform = .identity
    }
}

