//
//  Post.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    
    let id: String
    let userId: String
    var postTitle: String
    var postLikes: Int
    var postShares: Int
    var postUrl: String
    var isVideo: Bool
    let timesTamp: Timestamp //Times need firebase
    var user: User?
    
}
