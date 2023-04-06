//
//  FriendCollectionViewController.swift
//  L2.1_SavitskayaGalina
//
//  Created by emil kurbanov on 17.08.2022.
//
import UIKit
import RealmSwift

class FriendCollectionViewController: UICollectionViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoService().loadData(ownerId: userID) { [weak self] (complition) in
            DispatchQueue.main.async {
                self?.collectionPhotos = complition
                self?.collectionView.reloadData()
            }
        }
    }
    var userID = ""
    var collectionPhotos: [String] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosFriendCell", for: indexPath) as! PhotosFriendCollectionViewCell
        
        if let imgUrl = URL(string: collectionPhotos[indexPath.row]) {
            cell.photosFrienndImage.load(url: imgUrl)
        }
        
        return cell
    }
    
    // переход на контроллер с отображением крупной фотографии
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "shouBigPhotoUsers"{
//            
//            guard let photosFriend = segue.destination as? BigPhotoViewController else { return }
//            
//            // индекс нажатой ячейки
//            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
//                photosFriend.photosFr = collectionPhotos //фотки
//                photosFriend.selectPhotoIndex = indexPath.row
//            }
//        }
//    }
    
}


    
