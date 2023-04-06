//
//  UsersRealm.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 18.08.2022.
//

import Foundation
import RealmSwift

class UsersRealm: Object {
    @Persisted(primaryKey: true) var id: Int?
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var photo50: String
}



