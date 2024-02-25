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
}
