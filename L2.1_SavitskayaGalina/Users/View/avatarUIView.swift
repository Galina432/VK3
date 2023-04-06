//
//  avatarUIView.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 02.05.2022.
//

import UIKit

@IBDesignable
class avatarUIView: UIView {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var shadowView: UIView!
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize() {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowOpasity: Float = 0.0{
        didSet {
            self.layer.shadowOpacity = shadowOpasity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
   }
}
