//
//  ParsingOperation.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 29.01.2023.
//

import Foundation

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
//class ParsingOperation: Operation {

    //var groups: [GroupsResponse.Response.Items] = []
    
//    override func main() {
//        guard let dataOperation = dependencies.first(where: { $0 is FetchDataOperation }) as? FetchDataOperation,
//              let data = dataOperation.outputData,
//              let responseData = try? JSONDecoder().decode(GroupsResponse.self, from: data) else { return }
//        groups = responseData.response.items
//    }
  // }
    
//    class ParsingOperation: Operation {
//
//        private let completion: ([GroupsRealm]) -> Void
//
//        init(completion: @escaping ([GroupsRealm]) -> Void) {
//            self.completion = completion
//        }
//
//        override func main() {
//            guard let getGroupOperation = dependencies.first as? FetchDataOperation,
//                  let data = getGroupOperation.outputData else { return }
//
//            do {
//                let groups = try JSONDecoder().decode(GroupsResponse.self, from: data)
//
//                let realmGroups = groups.response.items.map { GroupsRealm(value: $0) }
//                    completion(realmGroups)
//            } catch let jsonError {
//                print(jsonError)
//            }
//        }
//    }
    
//class ParsingOperation: Operation {
//    
//    var groups: [GroupsRealm]?
//    
//    override func main() {
//        guard let fetchDataOperation = dependencies.first(where: { $0 is FetchDataOperation }) as? FetchDataOperation,
//              let data = fetchDataOperation.outputData else { return }
//        do {
//            let json = (try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]) ?? [:]
//            let response = (json["response"] as? [String : Any]) ?? [:]
//            let items = response["items"]
//            let itemsData = (try? JSONSerialization.data(withJSONObject: items as Any, options: .fragmentsAllowed)) ?? Data()
//            // let itemsData = try JSON(data)["response", "items"].rawData()
//            let groupsOp = try JSONDecoder().decode([GroupsRealm].self, from: itemsData)
//            self.groups = groupsOp
//        } catch {
//            print(error)
//        }
//    }
//}
//
//    
//let json = (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]) ?? [:]
//
//let response = (json["response"] as? [String : Any]) ?? [:]
//let items = response["items"]
//let profiles = response["profiles"]
//let groups = response["groups"]
//
//let itemsData = (try? JSONSerialization.data(withJSONObject: items as Any, options: .fragmentsAllowed)) ?? Data()
//let profileData = (try? JSONSerialization.data(withJSONObject: profiles as Any, options: .fragmentsAllowed)) ?? Data()
//let groupsData = (try? JSONSerialization.data(withJSONObject: groups as Any, options: .fragmentsAllowed)) ?? Data()
    
    
    

