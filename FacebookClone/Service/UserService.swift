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
    
    private init() {
        Task { try await fetchCurrentUser() }
    }
    
    @Published var currentUser: User?
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    @MainActor
    func reset() {
        self.currentUser = nil
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
}
