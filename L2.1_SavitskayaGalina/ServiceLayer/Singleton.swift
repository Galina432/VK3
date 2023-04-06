//
//  Singleton.swift
//  L2.1_SavitskayaGalina
//
//  Created by Galina on 04.06.2022.
//

import Foundation

final class Session {

    static let instance = Session()
    
    private init() {}

    var token = ""//хранение токена в VK
    var userId = 0//хранение идентификатора пользователя VK
}
