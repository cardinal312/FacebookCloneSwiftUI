//
//  UserService.swift
//  FacebookClone
//
//  Created by Macbook on 6/4/24.
//

import SwiftUI
import Firebase

final class UserService {
    static let shared = UserService()
    @Published var currentUser: User?
    @Published var friends: [User]?
    @Published var friendsRequests: [User]?
    
    private init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
        try await self.fetchFriends()
        try await self.fetchFriendsRequests()
    }
    
    @MainActor
    func reset() {
        self.currentUser = nil
        self.friends = nil
        self.friendsRequests = nil
    }
    
    @MainActor
    func uploadProfileImage(withImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "profileImageName" : imageUrl
        ])
        self.currentUser?.profileImageName = imageUrl
    }
    
    @MainActor
    func uploadCoverImage(withImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "coverImageName" : imageUrl
        ])
        self.currentUser?.coverImageName = imageUrl
    }
    
    @MainActor
    func fetchFriends() async throws {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self)}
        guard let friendsIds = self.currentUser?.friendsIds else { return }
        self.friends = users.filter { friendsIds.contains($0.id)}
    }
    
    @MainActor
    func fetchFriendsRequests() async throws {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self)}
        guard let friendsRequestsIds = self.currentUser?.friendsRequestsIDs else { return }
        self.friendsRequests = users.filter { friendsRequestsIds.contains($0.id)}
    }
    
    @MainActor
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
