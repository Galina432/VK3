//
//  NewsfeedService.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 08.01.2023.
//

//import Foundation
//import RealmSwift
//
//final class NewsfeedService {
//    
//    func getFeed() {
//        
//        let configuration = URLSessionConfiguration.default
//        let session =  URLSession(configuration: configuration)
//        
//        var urlConstructor = URLComponents()
//        urlConstructor.scheme = "https"
//        urlConstructor.host = "api.vk.com"
//        urlConstructor.path = "/method/newsfeed.get"
//        urlConstructor.queryItems = [
//            //URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
//            URLQueryItem(name: "filters", value: "post, photo"),
//            URLQueryItem(name: "access_token", value: Session.instance.token),
//            URLQueryItem(name: "v", value: "5.131")
//        ]
//        let url = urlConstructor.url!
//        
//        guard let url = urlConstructor.url else { return }
//        
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//                        guard let data = data, error == nil else {
//                            return
//                        }
//            
//                        do {
//                            let result = try JSONDecoder().decode(FeedResponseWrapped.self, from: data)
//                        
//                            print("---------> \(result)")
//                            
//                        } catch {
//                            print(error)
//        
//                        }
//                    }.resume()
//        }
//    
//}
