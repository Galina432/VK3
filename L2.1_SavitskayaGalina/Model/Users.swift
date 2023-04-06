//
//  Users.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 03.08.2022.
//

import Foundation

//struct UniversalResponse<T: Decodable>: Decodable {
//    let response: Users
//}
//
//struct Users: Decodable {
//    let count: Int
//    let items: [FriendsJson]
//}
//
//struct FriensJson: Decodable {
//    let id: Int
//    let firstName: String
//    let lastName: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firsName = "first_name"
//        case lastName = "last_name"
//    }
//}

struct FriendsJSONInfo: Decodable {
    let response: ResponseFriend
}
struct ResponseFriend: Decodable {
    let count: Int
    let items: [FriendArrayParam]
}
struct FriendArrayParam: Decodable {
    let id: Int
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case id
        case firsName = "first_name"
        case lastName = "last_name"
    }
}
