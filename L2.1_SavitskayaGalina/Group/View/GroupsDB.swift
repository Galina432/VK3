//
//  GroupsDB.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 25.03.2023.
//


import Foundation
import RealmSwift

final class GroupsDB: RealmDB {
    func save(_ groups: [RealmGroup]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(groups, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func fetch() -> [RealmGroup] {
        var groups = [RealmGroup]()
        do {
            let realm = try Realm()
            groups = Array(realm.objects(RealmGroup.self))
        } catch {
            print(error)
        }
        return groups
    }
}

class RealmDB {
    
    func deleteAll() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
        }
    }
}
