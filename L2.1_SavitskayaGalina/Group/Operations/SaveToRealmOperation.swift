//
//  SaveToRealmOperation.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 29.01.2023.
//

//import Foundation
//import RealmSwift
//import Realm

//class SaveToRealmOperation<ModelRealm: Object>: Operation {
//    var outputRealmModel: ModelRealm?
//}
//class ParsingOperation<Model: Decodable>: Operation {
//    var outputModel: Model?
//    
//    override func main() {
//        guard let loaderOperation = dependencies .first(where: { $0 is FetchDataOperation }) as? FetchDataOperation,
//              let data = loaderOperation.outputData
//        else { return }
//        
//        outputModel = try? JSONDecoder().decode(Model.self, from: data)
//    }
//}

//protocol DataStorageProtocol {
//    func save<Model: Object>(model: Model)
//    func restore<Model: Object>() -> [Model]
//}
//
//class SaveToRealmOperation: DataStorageProtocol {
//
//    private let realm = try? Realm()
//
//    func save<Model: Object>(model: Model) {
//        try? realm?.write({
//            realm?.add(model)
//        })
//    }
//
//    func restore<Model: Object>() -> [Model] {
//        guard let objects = realm?.objects(Model.self) else { return [] }
//        return Array(objects)
//    }
//}
//class SaveRealOperation: AsyncOperation{
//
//    override func main(){
//        guard let parseDataUserOperation = dependencies.first as? ParseDataUserOperation else { return }
//
//        RealmService.shared?.saveUsers(parseDataUserOperation.outputData)
//    }
//}

//class SaveToRealmOperation: Operation {
//    
//    override func main() {
//        guard let parseOperation = dependencies.first(where: { $0 is ParsingOperation }) as? ParsingOperation else { return }
//        try? GroupService.save(group: parseOperation.groups)
//    }
//}


import Foundation
import RealmSwift

//class RealmOperation: AsyncOperation {
//    
//    var result: Results<GroupsRealm>?
//    
//    override func main() {
//        guard let parseDataOperation = dependencies.first(where: { $0 is ParseDataOperation }) as? ParseDataOperation,
//              let friends = parseDataOperation.friends
//        else {
//            state = .finished
//            return
//        }
//        OperationQueue.main.addOperation {
//            self.save(friends)
//            self.fetch()
//            self.state = .finished
//        }
//    }
//    
//    private func save(_ friends: [RealmUser]) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(friends, update: .modified)
//            }
//        } catch {
//            print(error)
//        }
//    }
//    
//    private func fetch() {
//        do {
//            let realm = try Realm()
//            let friends = realm.objects(RealmUser.self)
//            result = friends
//        } catch {
//            print(error)
//        }
//    }
//}

//final class SaveToRealmOperation: AsyncOperation {
//    
//    override func main() {
//        guard let parsingGroupOperation = dependencies.first as? ParsingOperation else { return }
//        let vkGroup = parsingGroupOperation.
//        DispatchQueue.main.async {
//            let groups = vkGroup.map { GroupsRealm(value: $0) }
//            do {
//                let myGroupID = groups.map {$0.id}
//                let notMyGroupsID = try GroupService.restore(Groups.self)
//                
//                //try GroupService.load(typeOf: GroupsRealm.self).filter(NSPredicate(format: "NOT (id IN %@)", myGroupID))
//                
//                try GroupService.delete(object: notMyGroupsID)
//                try GroupService.save(items: groups)
//            } catch {
//                print(error)
//            }
//            self.state = .finished
//        }
//    }
//}
