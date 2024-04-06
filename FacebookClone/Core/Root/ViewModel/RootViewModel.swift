//
//  RootViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 6/4/24.
//

import SwiftUI
import Combine
import Firebase

final class RootViewModel: ObservableObject {
    
    private var store: Set<AnyCancellable> = []
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &store)
    }
}
