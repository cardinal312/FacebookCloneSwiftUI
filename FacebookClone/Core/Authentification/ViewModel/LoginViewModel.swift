//
//  LoginViewViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
