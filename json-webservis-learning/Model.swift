//
//  Model.swift
//  json-webservis-learning
//
//  Created by Anıl AVCI on 16.07.2022.
//

import Foundation

struct Photo {
    
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init(_ dictionary: [String: Any]) {
        self.albumId = dictionary["albumId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.thumbnailUrl = dictionary["thumbnailUrl"] as? String ?? ""
    }
    
}

struct Comment {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    init(_ dictionary: [String: Any]) {
        self.postId = dictionary["postId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.body = dictionary["body"] as? String ?? ""
    }
    
}

