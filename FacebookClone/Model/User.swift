//
//  User.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var firstName: String
    var familyName: String
    var email: String
    var profileImageName: String?
    var coverImageName: String?
    var age: Int
    let gerder: String
    var friendsIds: [String]
    var friendsRequestsIDs: [String]
    var isCurrentUser: Bool
}
