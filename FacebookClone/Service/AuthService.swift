//
//  AuthService.swift
//  FacebookClone
//
//  Created by Macbook on 26/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class AuthService: ObservableObject {
    
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    @MainActor
    private func uploadUserData(firstName: String, familyName: String, email: String, age: Int, gender: String, id: String) async throws {
        let user = User(id: id, firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, friendsIds: [], friendsRequestsIDs: [], isCurrentUser: true)
        guard let userData = try? Firestore.Encoder().encode(user) else { print(NetworkError.canNotUploadUserData); return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
    
    @MainActor
    func createUser(email: String, password: String, firstName: String, familyName: String, age: Int, gender: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, id: result.user.uid)
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Failed to create user \(NetworkError.cantCreateUser) - \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        }
        catch {
            print("Failed to login \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
}

enum NetworkError: Error {
    case canNotUploadUserData, cantCreateUser
}
