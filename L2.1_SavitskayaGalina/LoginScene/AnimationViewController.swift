//
//  AnimationViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 10.05.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            self.label1.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 1, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            self.label2.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 1.5, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            self.label3.alpha = 0
        })
                    
        }
    
}


