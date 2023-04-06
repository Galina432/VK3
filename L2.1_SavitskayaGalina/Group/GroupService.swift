//
//  GroupService.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 07.06.2022.
//

import Foundation
import RealmSwift


//final class GroupService {
//    
//    func loadGroup(complition: @escaping ([Groups]) -> Void ) {
//
//    var components = URLComponents()
//    components.scheme = "https"
//    components.host = "api.vk.com"
//    components.path = "/method/groups.get"
//    components.queryItems = [
//        URLQueryItem(name: "extended", value: "1"),
//        URLQueryItem(name: "v", value: "5.131"),
//        URLQueryItem(name: "fields", value: "country,can_post"),
//        URLQueryItem(name: "access_token", value: Session.instance.token )
//    ]
//
//    guard let url = components.url else { return }
//    
//    let request = URLRequest(url: url)
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data, error == nil else {
//            return
//        }
//        
//        do {
//            let arrayGroups = try JSONDecoder().decode(GroupsResponse.self, from: data)
//            print(arrayGroups)
//            
//            let realmGroups: [GroupsRealm] = arrayGroups.response.items.map { group in
//                let realmGr = GroupsRealm()
//                realmGr.id = group.id
//                realmGr.name = group.name
//                realmGr.screenName = group.screenName
//                realmGr.photo50 = group.photo50
//                
//                return realmGr
//            }
//            
//            self.save(group: realmGroups)
//            
//            var fullGroupList: [Groups] = []
//            //здесь я прохожусь по данным, которые приходят и беру имя и картинку, эти данные добавляю в массив fullGroupList
//            //далее замыкаю его в complition, то есть данные будут передаваться далее в TableView
//            for i in 0...arrayGroups.response.items.count-1 {
//                let name = arrayGroups.response.items[i].name
//                let avatar = arrayGroups.response.items[i].photo50
//                fullGroupList.append(Groups.init(groupName: name, groupLogo: avatar))
//            }
//            complition(fullGroupList)
//        } catch let error {
//            print(error)
//            complition([])
//        }
//    }.resume()
//}
//    
//    func save(group: [GroupsRealm]) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                group.forEach { realm.add($0, update: .all) }
//            }
//        } catch {
//            print(error)
//        }
//    }
//    
//    func restore() throws -> [Groups] {
//        let realm = try Realm()
//
//        let objects = realm.objects(GroupsRealm.self)
//        let groupMy = Array(
//            objects.map {
//                Groups(
//                    groupName: $0.name,
//                    groupLogo: $0.photo50
//                )
//            }
//        )
//        return groupMy
//    }
//}
