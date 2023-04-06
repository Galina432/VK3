//
//  PhotoCell.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 24.04.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var likeControle: LikeControl!
    @IBOutlet var containerView: UIView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        containerView.addGestureRecognizer(tap)
    }

    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControle.isLike.toggle()
        
        if likeControle.isLike {
            likeControle.likePicture.image = UIImage(systemName: "suit.heart.fill")
            countLabel.textColor = .red
            touches += 1
            
            UIView.transition(with: countLabel,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: {
                self.countLabel.textColor = .red
            })
    
        } else {
            likeControle.likePicture.image = nil
            countLabel.textColor = .black
            touches -= 1
            
            UIView.transition(with: countLabel,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: {
                self.countLabel.textColor = .black
            })
        }
    }
    
    @IBOutlet var countLabel: UILabel!
    
    var touches = 37 {
        didSet{
            countLabel.text = "\(touches)"
        }
    }
}








