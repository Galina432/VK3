//
//  GroupSearchService.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 09.06.2022.
//

import Foundation
import UIKit

//func loadGroupSearch(searchText: String) {
//
//   // guard let token = Session.instance.token else { return }
//  //  guard let id = Session.instance.userId else { return }
//
//    var components = URLComponents()
//    components.scheme = "https"
//    components.host = "api.vk.com"
//    components.path = "/method/groups.search"
//    components.queryItems = [
//        URLQueryItem(name: "q", value: searchText),
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
//            let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//            print(result)
//        } catch {
//            print(error)
//        }
//    }.resume()
//}
//
