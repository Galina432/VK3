//
//  Newsfeed.swift
//  L2.1_SavitskayaGalina
//
//  Created by Irina on 10.01.2023.
//

import Foundation
import UIKit


struct FeedResponseWrapped: Codable {
    var response: FeedResponse
}

struct FeedResponse: Codable {
    var items: [NewItem]
    var profiles: [UserProfile]
    var groups: [UserGroup]
    
    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
    }
}

struct NewItem: Codable {
    let postID: Int
    let ownerID: Int
    let text: String?
    let date: Double
    let attachments: [Attachment]?
    let likes: CountableItem
    let comments: CountableItem
    let reposts: CountableItem
    let views: CountableItem
    let sourceID: Int
    var avatarURL: String?
    var creatorName: String?
    var photosURL: [String]? {
        get {
            let photosURL = attachments?.compactMap{ $0.photo?.sizes?.last?.url }
            return photosURL
        }
    }
    
    var aspectRatio: CGFloat {
        get {
            let aspectRatio = attachments?.compactMap{ $0.photo?.sizes?.last?.aspectRatio }.last
            return aspectRatio ?? 1
        }
    }

    enum CodingKeys: String, CodingKey {
        case postID = "post_id"
        case ownerID = "owner_id"
        case text
        case date
        case attachments
        case likes
        case comments
        case reposts
        case views
        case sourceID = "source_id"
        case avatarURL
        case creatorName
    }
}

struct Attachment: Codable {
    let type: String?
    let photo: PhotoNews?
}

struct CountableItem: Codable {
    var count: Int?
}

struct PhotoNews: Codable {
    let albumID, id, date: Int
    let text: String
    let userID: Int?
    let sizes: [Size]?
    let ownerID: Int
    let accessKey: String
        
    var photoNum: Size? {
        guard let sizes = self.sizes else { return nil }
            if let photo = sizes.first(where: {$0.type == "x"}) { return photo }
            if let photo = sizes.first(where: {$0.type == "z"}) { return photo }
            if let photo = sizes.first(where: {$0.type == "y"}) { return photo }
            if let photo = sizes.first(where: {$0.type == "m"}) { return photo }
            if let photo = sizes.first(where: {$0.type == "s"}) { return photo }
            return sizes.first
        }

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case ownerID = "owner_id"
        case accessKey = "access_key"
    }
}

struct Size: Codable {
    let type: String?
    let url: String?
    let width, height: Int
    
    var aspectRatio: CGFloat { return CGFloat(height)/CGFloat(width) }
}

struct UserProfile: Codable {
    let id: Int
    let firstName: String?
    let lastName: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarURL = "photo_100"
    }
}

struct UserGroup: Codable {
    let id: Int
    let name: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarURL = "photo_100"
    }
}


