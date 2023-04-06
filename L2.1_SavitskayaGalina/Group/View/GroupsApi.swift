//
//  GroupsApi.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 25.03.2023.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

final class GroupsAPI: VkAPI {
    
//    func loadVkGroups(completion: @escaping ([RealmGroup]) -> Void) {
//
//        let path = "/groups.get"
//        let parameters: Parameters = [
//            "user_id" : userId,
//            "access_token" : accessToken,
//            "extended" : "1",
//            "fields" : "id, name, photo_100",
//            "v" : "5.131"
//        ]
//
//        let url = baseUrl + path
//
//        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: RealmGroup.self) { response in
//            //            print(response.request)
//
//            guard let jsonData = response.data else { return }
//
//            do {
//                let itemsData = try JSON(jsonData)["response", "items"].rawData()
//                let groups = try JSONDecoder().decode([RealmGroup].self, from: itemsData)
//                completion(groups)
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    func loadVkGroups() -> Promise<[RealmGroup]> {
        
        let path = "/groups.get"
        let parameters: Parameters = [
            "user_id" : userId,
            "access_token" : accessToken,
            "extended" : "1",
            "fields" : "id, name, photo_100",
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        return Promise.init { resolver in
            AF.request(url, method: .get, parameters: parameters).response { response in
                switch response.result {
                case .failure(let error):
                    resolver.reject(error)
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let itemsData = try JSON(data)["response", "items"].rawData()
                        let groups = try JSONDecoder().decode([RealmGroup].self, from: itemsData)
                        resolver.fulfill(groups)
                    } catch {
                        resolver.reject(error)
                    }
                }
            }
        }
    }
    
    func searchVkGroups(searchText: String, completion: @escaping ([RealmGroup]) -> Void) {
        
        let path = "/groups.search"
        let parameters: Parameters = [
            "access_token" : accessToken,
            "q" : searchText,
            "sort" : "6",
            "count" : "100",
            "v" : "5.131"
        ]
        
        let url = baseUrl + path
        
        if searchText != "" {
            AF.request(url, method: .get, parameters: parameters).responseData { response in
                            //print(response.response)
                
                guard let data = response.data else { return }
                
                do {
                    let itemsData = try JSON(data)["response", "items"].rawData()
                    let groups = try JSONDecoder().decode([RealmGroup].self, from: itemsData)
                    completion(groups)
                } catch {
                    print(error)
                }
            }
        }
    }
}

class VkAPI {
    let baseUrl = "https://api.vk.com/method"
    let userId = Session.instance.userId
    let accessToken = Session.instance.token
    let versionVkApi = "5.131"
}
