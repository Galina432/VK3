//
//  News.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 09.01.2023.
//

import Foundation

struct NewsfeedResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var items: [Items]
        
        struct Items: Decodable {
            var souce_id: Int
            var post_id: Int
            var text: String?
            var date: Double
            var comments: CountableItem?
            var likes: CountableItem?
            var reposts: CountableItem?
            var views: CountableItem?
            
            struct CountableItem: Decodable {
                var count: Int
                
            }
        }
    }
}

                            
                            
                            //            enum CodingKeys: String, CodingKey {
                            //                case id, name
                            //                case screenName = "screen_name"
                            //                case photo50 = "photo_50"
                            //            }
                        
                
                //struct Newsfeed: Equatable {
                //    let groupName: String
                //    let groupLogo: String
                
                // для проведения сравнения (.contains), только по имени
                //    static func == (lhs: Groups, rhs: Groups) -> Bool {
                //        return lhs.groupName == rhs.groupName
           




