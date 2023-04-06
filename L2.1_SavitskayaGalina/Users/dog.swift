//
//  dog.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 04.09.2022.
//

import Foundation
import FirebaseDatabase

struct Dog: Codable {
    let name: String
    
    var toAnyObject: Any {
        return [
            "name": name
        ]
    }
}

struct Human {
    let name: String
    let gender: Bool
    let age: Int
    var dogs: [Dog]
    
    var toAnyObject: Any {
        return [
            "name": name,
            "gender": gender,
            "age": age,
            "dogs": dogs.map { $0.toAnyObject }
        ]
    }
}

let ivanDogs = [
Dog(name: "sharik"),
Dog(name: "bim")
]

let annaDogs = [
Dog(name: "Drugok"),
Dog(name: "Barbos"),
Dog(name: "Bublik")
]

let ivan = Human(name: "ivan", gender: true, age: 25, dogs: ivanDogs)
let anna = Human(name: "anna", gender: false, age: 17, dogs: annaDogs)

let data = [ivan, anna].map { $0.toAnyObject }
print(data)

[["name": "ivan", "gender": true, "age": 25, "dogs": [["name": "sharik"], ["name": "bim"]]], ["name": "anna", "gender": false, "age": 17, "dogs": [["name": "Drugok"], ["name": "Barbos"], ["name": "Bublik"]]]]
 
let dbLink = Database.database().reference()
dbLink.child("Humans").setValue(data)

