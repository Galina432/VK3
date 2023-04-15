//
//  Groups.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 03.08.2022.
//

import Foundation
//
//struct GroupsResponse: Decodable {
//    var response: Response
//
//    struct Response: Decodable {
//        var count: Int
//        var items: [Items]
//
//        struct Items: Decodable {
//            var id: Int
//            var name: String
//            var screenName: String
//            var photo50: String
//
//            enum CodingKeys: String, CodingKey {
//                case id, name
//                case screenName = "screen_name"
//                case photo50 = "photo_50"
//            }
//        }
//    }
//}
//
//struct Groups: Equatable {
//    let groupName: String
//    let groupLogo: String
//
//    // для проведения сравнения (.contains), только по имени
//    static func == (lhs: Groups, rhs: Groups) -> Bool {
//        return lhs.groupName == rhs.groupName
//    }
//}

struct Group {
    let id: Int
    let name: String
    let avatar: String
}


