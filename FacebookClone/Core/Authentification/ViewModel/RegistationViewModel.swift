//
//  RegistationViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//
import Foundation

final class RegistationViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var gender: String = ""
    @Published var genderChoices: [String] = ["Female", "Male", "More options"]
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws {
        if let age = Int(age) {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: age, gender: gender)
        } else {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, familyName: familyName, age: 0, gender: gender)
        }
    }
}


