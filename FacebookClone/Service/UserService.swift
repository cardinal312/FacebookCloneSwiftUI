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
    private init() {}
    
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
}
