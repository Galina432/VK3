//
//  File.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 05.09.2022.
//


//import UIKit
//import FirebaseFirestoreSwift
//import FirebaseFirestore
//
//struct UserDocument: Decodable {
//    let userId: [String]
//}
//
//class ViewControllerFirebase: UIViewController {
//
//    let db = Firestore.firestore()
//
//    @IBAction func testWrite() {
//        loadUsers { users in
//            var usersCopy = users
//            usersCopy.append(UUID().uuidString)
//
//            self.writeToUsers(users: usersCopy)
//        }
//
//
//    }
//    
//    @IBAction func testRead() {
//        loadUsers { users in
//            print(users)
//        }
//    }
//
//    func loadUsers(usersHandler: @escaping ([String]) -> Void) {
//        db
//            .collection("authentificatedUsers")
//            .document("Users")
//            .getDocument { snapshot, error in
//                print(error as Any)
//
//                guard
//                    let dataDict = snapshot?.data(),
//                    let data = try? JSONSerialization.data(withJSONObject: dataDict, options: .fragmentsAllowed),
//                    let userDocument = try? JSONDecoder().decode(UserDocument.self, from: data)
//                else { return }
//
//                usersHandler(userDocument.userId)
//            }
//    }
//
//    func writeToUsers(users: [String]) {
//        db
//            .collection("authentificatedUsers")
//            .document("Users")
//            .setData(["userId" : users])
//    }
//}
