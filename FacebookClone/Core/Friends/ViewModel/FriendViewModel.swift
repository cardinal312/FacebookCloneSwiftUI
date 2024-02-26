//
//  FriendViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import Foundation

final class FriendViewModel: ObservableObject {
    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Cardinal", familyName: "312", email: "manasov7777@gmail.com", profileImageName: "me", age: 28, gender: "male", friendsIds: ["3"], friendsRequestsIDs: ["1","2","4"], isCurrentUser: true),
        .init(id: "1", firstName: "Dwight", familyName: "Schrute", email: "dwight.schrute@gmail.com", profileImageName: "dwight", age: 50, gender: "male", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "2", firstName: "Pam", familyName: "Beesly", email: "pam.beesly@gmail.com", profileImageName: "pam", age: 42, gender: "female", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "3", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", age: 40, gender: "male", friendsIds: ["0"], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "4", firstName: "Natasha", familyName: "Romanov", email: "natasha.romanov@gmail.com", profileImageName: "romanov", age: 38, gender: "female", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
    ]
    
    @Published var friendsRequests: [User] = []
    
    init() {
        setupFriendsRequests()
    }
    
    private func setupFriendsRequests() {
        self.friendsRequests = self.users.filter { self.users[0].friendsRequestsIDs.contains($0.id)}
    }
}
