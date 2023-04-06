//
//  RealmOperation.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 25.03.2023.
//

import Foundation
import RealmSwift

//class RealmOperation: AsyncOperation {
//
//    var result: Results<GroupsRealm>?
//
//    override func main() {
//        guard let parsingOperation = dependencies.first(where: { $0 is ParsingOperation }) as? ParsingOperation,
//              let groups = parsingOperation.groups
//        else {
//            state = .finished
//            return
//        }
//        OperationQueue.main.addOperation {
//            self.save(groups)
//            self.fetch()
//            self.state = .finished
//        }
//    }
//
//    private func save(_ groups: [GroupsRealm]) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(groups, update: .modified)
//            }
//        } catch {
//            print(error)
//        }
//    }
//
//    private func fetch() {
//        do {
//            let realm = try Realm()
//            let groups = realm.objects(GroupsRealm.self)
//            result = groups
//        } catch {
//            print(error)
//        }
//    }
//}
