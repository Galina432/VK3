//
//  PhotoRealm.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 18.08.2022.
//

import Foundation
import RealmSwift

class SizesRealm: Object {
    @Persisted var height: Int
    @Persisted var url: String
    @Persisted var type: String
    @Persisted var width: Int
}

class PhotoRealm: Object {
    @Persisted var albumId: Int
    @Persisted var date: Int
    @Persisted(primaryKey: true) var id: Int
    @Persisted var ownerId: Int
    @Persisted var hasTags: Bool
    @Persisted var sizes: List<SizesRealm>
    @Persisted var text: String
}


