//
//  GroupsRealm.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 18.08.2022.
//

import Foundation
import RealmSwift

class RealmGroup: Object, Decodable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var avatar = ""
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "id": id,
            "name": name
        ]
    }
}

