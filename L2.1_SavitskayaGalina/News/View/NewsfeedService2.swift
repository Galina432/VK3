//
//  NewsfeedService2.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 28.01.2023.
//

import Foundation
import RealmSwift
import UIKit

final class NewsfeedService {
    
    func parse(data: Data, completionHandler: @escaping (FeedResponse) -> Void) {
        
        DispatchQueue.global().async {
            
            var parsedItems = [NewItem]()
            var parsedProfiles = [UserProfile]()
            var parsedGroups = [UserGroup]()
            
            let json = (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]) ?? [:]
            
            let response = (json["response"] as? [String : Any]) ?? [:]
            let items = response["items"]
            let profiles = response["profiles"]
            let groups = response["groups"]
            
            let itemsData = (try? JSONSerialization.data(withJSONObject: items as Any, options: .fragmentsAllowed)) ?? Data()
            let profileData = (try? JSONSerialization.data(withJSONObject: profiles as Any, options: .fragmentsAllowed)) ?? Data()
            let groupsData = (try? JSONSerialization.data(withJSONObject: groups as Any, options: .fragmentsAllowed)) ?? Data()
            
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            dispatchGroup.enter()
            dispatchGroup.enter()
            
            DispatchQueue.global().async {
                let modelNews = try? JSONDecoder().decode([NewItem].self, from: itemsData)
                parsedItems = modelNews ?? []
                dispatchGroup.leave()
            }
            
            DispatchQueue.global().async {
                let modelProfile = try? JSONDecoder().decode([UserProfile].self, from: profileData)
                parsedProfiles = modelProfile ?? []
                dispatchGroup.leave()
            }
            
            DispatchQueue.global().async {
                let modelGroup = try? JSONDecoder().decode([UserGroup].self, from: groupsData)
                parsedGroups = modelGroup ?? []
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .global()) {
                let news = FeedResponse(
                    items: parsedItems,
                    profiles: parsedProfiles,
                    groups: parsedGroups
                    )
                completionHandler(news)
            }
        }
    }
    
    func loadData(completion: @escaping (Data) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/newsfeed.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "filters", value: "post, photo"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
            //URLQueryItem(name: "start_from", value: "next_from"),
            URLQueryItem(name: "count", value: "10")
        ]
        let url = urlConstructor.url!
        
        guard let url = urlConstructor.url else { return }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
                        guard let data = data else {
                            return
                        }
                        completion(data)
                    }.resume()
        }
    
    func loadData(startFrom: String? = nil, startTime: TimeInterval? = nil, completion: @escaping (Data) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/newsfeed.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "filters", value: "post, photo"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "count", value: "10")
        ]
        if let startFrom = startFrom {
                urlConstructor.queryItems?.append(URLQueryItem(name: "start_from", value: startFrom))
        }
        if let startTime = startTime {
            urlConstructor.queryItems?.append(URLQueryItem(name: "start_time", value: String(startTime)))
        }
        
        let url = urlConstructor.url!

        guard let url = urlConstructor.url else { return }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            
                        guard let data = data else {
                            return
                        }
                        completion(data)
                    }.resume()
        }
    
    func parse(data: Data, completionHandler: @escaping (FeedResponse, String) -> Void) {
        
        DispatchQueue.global().async {
            
            var parsedItems = [NewItem]()
            var parsedProfiles = [UserProfile]()
            var parsedGroups = [UserGroup]()
            var parsedNextFrom = String()
            
            let json = (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]) ?? [:]
            
            let response = (json["response"] as? [String : Any]) ?? [:]
            let items = response["items"]
            let profiles = response["profiles"]
            let groups = response["groups"]
            let nextFrom = response["next_from"]
            
            let itemsData = (try? JSONSerialization.data(withJSONObject: items as Any, options: .fragmentsAllowed)) ?? Data()
            let profileData = (try? JSONSerialization.data(withJSONObject: profiles as Any, options: .fragmentsAllowed)) ?? Data()
            let groupsData = (try? JSONSerialization.data(withJSONObject: groups as Any, options: .fragmentsAllowed)) ?? Data()
            let nextFromData = (try? JSONSerialization.data(withJSONObject: nextFrom as Any,options: .fragmentsAllowed)) ?? Data()
            
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            dispatchGroup.enter()
            dispatchGroup.enter()
            dispatchGroup.enter()
            
            DispatchQueue.global().async {
                let modelNews = try? JSONDecoder().decode([NewItem].self, from: itemsData)
                parsedItems = modelNews ?? []
                dispatchGroup.leave()
            }
            
            DispatchQueue.global().async {
                let modelProfile = try? JSONDecoder().decode([UserProfile].self, from: profileData)
                parsedProfiles = modelProfile ?? []
                dispatchGroup.leave()
            }
            
            DispatchQueue.global().async {
                let modelGroup = try? JSONDecoder().decode([UserGroup].self, from: groupsData)
                parsedGroups = modelGroup ?? []
                dispatchGroup.leave()
            }
            
            DispatchQueue.global().async {
                let modelNextFromData = try? JSONDecoder().decode(String.self, from: nextFromData)
                parsedNextFrom = modelNextFromData ?? ""
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .global()) {
                let news = FeedResponse(
                    items: parsedItems,
                    profiles: parsedProfiles,
                    groups: parsedGroups
                    )
                completionHandler(news, parsedNextFrom)
            }
        }
    }
    
}



