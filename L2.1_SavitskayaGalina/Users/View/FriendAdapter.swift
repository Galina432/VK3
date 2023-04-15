//
//  FriendAdapter.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 15.04.2023.
//

import Foundation
import RealmSwift

class FriendAdapter {
    
    func loadData(complition: @escaping ([Users]) -> Void ) {
        
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let arrayFriends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                print(arrayFriends)
                
                let realmFriends: [UsersRealm] = arrayFriends.response.items.map { friend in
                    let realmGr = UsersRealm()
                    realmGr.id = friend.id
                    realmGr.photo50 = friend.photo50
                    realmGr.lastName = friend.lastName
                    realmGr.firstName = friend.firstName
                    
                    return realmGr
                }
                
                self.save(friends: realmFriends)
                
                var fullNamesFriends: [Users] = []
                for i in 0...arrayFriends.response.items.count-1 {
                    let name = ((arrayFriends.response.items[i].lastName) + " " + (arrayFriends.response.items[i].firstName))
                    let avatar = arrayFriends.response.items[i].photo50
                    let id = String(arrayFriends.response.items[i].id)
                    fullNamesFriends.append(Users.init(userName: name, userAvatar: avatar, owner_id: id))
                }
                complition(fullNamesFriends)
            } catch let error {
                print(error)
                complition([])
            }
        }
        task.resume()
    }
    
    private func save(friends: [UsersRealm]) {
        do {
            let realm = try Realm()
            try realm.write {
                friends.forEach { realm.add($0, update: .all) }
            }
        } catch {
            print(error)
        }
    }
    
    private func restore() throws -> [Users] {
        let realm = try Realm()
        
        let objects = realm.objects(UsersRealm.self)
        let friendMy = Array(
            objects.map {
                Users(
                    userName: $0.lastName + $0.firstName,
                    userAvatar: $0.photo50,
                    owner_id: String($0.id!)
                )
            })
        return friendMy
    }
}
