//
//  BigPhotoViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 21.05.2022.
//


import UIKit

//class BigPhotoViewController: UIViewController {
//    
//    @IBOutlet var bigPhotoImage: UIImageView! {
//        didSet {
//            bigPhotoImage.isUserInteractionEnabled = true
//        }
//    }
//    
//    private var additionImageView = UIImageView()
    
   // public var photos: [UIImage] = []
//    public var photosFr: [String] = []
//    public var selectPhotoIndex: Int = 0

//    override func viewDidLoad() {
//        super.viewDidLoad()
        
//        guard !photosFr.isEmpty else {return}
        
 //       bigPhotoImage.image = photos[selectPhotoIndex]
        
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeFunc))
//        leftSwipe.direction = .left
//        bigPhotoImage.addGestureRecognizer(leftSwipe)
//
//        view.addSubview(additionImageView)
//        view.sendSubviewToBack(additionImageView)
//
//        additionImageView.translatesAutoresizingMaskIntoConstraints = false
//        additionImageView.contentMode = .scaleAspectFit
//
//        NSLayoutConstraint.activate([
//            additionImageView.leadingAnchor.constraint(equalTo: bigPhotoImage.leadingAnchor),
//            additionImageView.trailingAnchor.constraint(equalTo: bigPhotoImage.trailingAnchor),
//            additionImageView.topAnchor.constraint(equalTo: bigPhotoImage.topAnchor),
//            additionImageView.bottomAnchor.constraint(equalTo: bigPhotoImage.bottomAnchor)
//        ])
    
//    }
    
//    @objc func leftSwipeFunc() {
//
//        guard self.selectPhotoIndex + 1 < self.photos.count else {return}
//
//        additionImageView.transform = CGAffineTransform(translationX: 1.5*additionImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
//        additionImageView.image = photos[selectPhotoIndex+1]
//
//        UIView.animate(withDuration: 1,
//                       delay: 0,
//                       options: .curveEaseIn) {
//            self.bigPhotoImage.transform = CGAffineTransform(translationX: -self.bigPhotoImage.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//
//            self.additionImageView.transform = .identity
//        } completion: { _ in
//
//            self.selectPhotoIndex += 1
//            self.bigPhotoImage.image = self.photos[self.selectPhotoIndex]
//            self.bigPhotoImage.transform = .identity
//
//            self.additionImageView.image = nil
//    }
//}

//    @IBAction func photoSwipeRight(_ sender: Any) {
//
//        guard selectPhotoIndex >= 1 else {return}
//
//        additionImageView.transform = CGAffineTransform(translationX: -1.5*additionImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
//        additionImageView.image = photos[selectPhotoIndex-1]
//
//        UIView.animate(withDuration: 1,
//                       delay: 0,
//                       options: .curveEaseIn) {
//            self.bigPhotoImage.transform = CGAffineTransform(translationX: 1.5*self.bigPhotoImage.bounds.width, y: -200).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
//            self.additionImageView.transform = .identity
//        } completion: {_ in
//            self.selectPhotoIndex -= 1
//            self.bigPhotoImage.image = self.photos[self.selectPhotoIndex]
//            self.bigPhotoImage.transform = .identity
//
//            self.additionImageView.image = nil
//        }
//    }
//}
