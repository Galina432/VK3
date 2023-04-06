//
//  FirebaseCommunities.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 31.08.2022.
//

//import Firebase
//import FirebaseDatabase
//
//class FirebaseCommunities {
//    let groupName: String
//    let groupId: Int
//    
//    let ref: DatabaseReference?
//    
//    init(groupName: String, id: Int) {
//        self.ref = nil
//        self.groupId = id
//        self.groupName = groupName
//    }
//    
//    init?(snapshot: DataSnapshot) {
//        guard
//            let value = snapshot.value as? [String: Any],
//            let id = value["groupId"] as? Int,
//            let name = value["groupName"] as? String
//        else {
//            return nil
//        }
//        self.ref = snapshot.ref
//        self.groupId = id
//        self.groupName = name
//    }
//    
//    func toAnyObject() -> [String: Any] {
//        ["groupId": groupId,
//         "groupName": groupName]
//    }
//}
