//
//  Users.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 06.08.2022.
//

import Foundation

struct FriendsResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Items]
        
        struct Items: Decodable {
            var id: Int
            var firstName: String
            var lastName: String
            var photo50: String
            
            enum CodingKeys: String, CodingKey {
                case id
                case firstName = "first_name"
                case lastName = "last_name"
                case photo50 = "photo_50"
            }
        }
    }
}

struct Users: Equatable {
    var userName: String
    var userAvatar: String
    var owner_id: String
    //var userPhotos: [UIImage?]
}
