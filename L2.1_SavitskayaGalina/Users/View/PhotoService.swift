//
//  PhotoService.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 09.06.2022.
//  Created by emil kurbanov on 17.08.2022.

import Foundation
import RealmSwift

class PhotoService {
    
    func loadData(ownerId: String, complition: @escaping ([String]) -> Void ) {
        
        let configuration = URLSessionConfiguration.default
    
        let session =  URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: ownerId),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
                
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
        
            guard let data = data else { return }
            
            do {
                let arrayPhotosFriend = try JSONDecoder().decode(PhotosResponse.self, from: data)
                print(arrayPhotosFriend)
                
                let realmPhoto: [PhotoRealm] = arrayPhotosFriend.response.items.map { photo in
                    let realmGr = PhotoRealm()
                    realmGr.albumId = photo.albumId
                    realmGr.date = photo.date
                    realmGr.id = photo.id
                    realmGr.ownerId = photo.ownerId
                    realmGr.hasTags = photo.hasTags
                    
                    let realmSz: [SizesRealm] = photo.sizes.map { photoUrl in
                        let realmSize = SizesRealm()
                        realmSize.height = photoUrl.height
                        realmSize.url = photoUrl.url
                        realmSize.type = photoUrl.type
                        realmSize.width = photoUrl.width
                        return realmSize
                    }
                    realmGr.sizes.append(objectsIn: realmSz)
                    realmGr.text = photo.text
                    return realmGr
                }

                self.save(photo: realmPhoto)
                
                var photosFriend: [String] = []
                
                for i in 0...arrayPhotosFriend.response.items.count-1 {
                    if let urlPhoto = arrayPhotosFriend.response.items[i].sizes.last?.url {
                        photosFriend.append(urlPhoto)
                    }
                }
                
                complition(photosFriend)
                
            } catch let error {
                print(error)
                complition([])
            }
        }
        task.resume()
    }
    private func save(photo: [PhotoRealm]) {
        do {
            let realm = try Realm()
            try realm.write {
                photo.forEach { realm.add($0, update: .all) }
            }
        } catch {
            print(error)
        }
    }
}
