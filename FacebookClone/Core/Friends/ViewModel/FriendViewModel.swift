//
//  FriendViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import Foundation
import Combine

final class FriendViewModel: ObservableObject {
    
    @Published var friendsRequests: [User] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupFriendsRequests()
    }
    
    private func setupFriendsRequests() {
        UserService.shared.$friendsRequests.sink { [weak self] friendsRequests in
            self?.friendsRequests = friendsRequests ?? []
        }
        .store(in: &cancellables)
    }
}
