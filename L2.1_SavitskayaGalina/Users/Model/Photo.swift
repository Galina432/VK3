//
//  Photo.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 06.08.2022.
//

import Foundation

struct PhotosResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Items]
        
        struct Items: Decodable {
            var albumId: Int
            var date: Int
            var id: Int
            var ownerId: Int
            var hasTags: Bool
            var sizes: [Sizes]
            var text: String
            
            enum CodingKeys: String, CodingKey {
                case date, id, sizes, text
                case albumId = "album_id"
                case ownerId = "owner_id"
                case hasTags = "has_tags"
            }
            struct Sizes: Decodable {
                var height: Int
                var url: String
                var type: String
                var width: Int
            }
        }
    }
}

struct PhotosImage: Equatable {
    let friendId: String
    let photos: String
    
    static func == (lhs: PhotosImage, rhs: PhotosImage) -> Bool {
        return lhs.friendId == lhs.friendId
    }
}

