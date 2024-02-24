//
//  FeedViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI
import PhotosUI

final class FeedViewModel: ObservableObject {
    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Cardinal", familyName: "312", email: "manasov7777@gmail.com", profileImageName: "me",coverImageName: "bruce", age: 28, gerder: "male", friendsIds: ["3", "5", "6", "7"], friendsRequestsIDs: ["1","2","4"], isCurrentUser: true),
        .init(id: "1", firstName: "Dwight", familyName: "Schrute", email: "dwight.schrute@gmail.com", profileImageName: "dwight", age: 50, gerder: "male", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "2", firstName: "Pam", familyName: "Beesly", email: "pam.beesly@gmail.com", profileImageName: "pam", age: 42, gerder: "female", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "3", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", coverImageName: "story1", age: 40, gerder: "male", friendsIds: ["0"], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "4", firstName: "Natasha", familyName: "Romanov", email: "natasha.romanov@gmail.com", profileImageName: "romanov", age: 38, gerder: "female", friendsIds: [], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "5", firstName: "Elizabeth", familyName: "Olsen", email: "elizabeth.olsen@gmail.com", profileImageName: "profilePic2", coverImageName: "story2", age: 32, gerder: "female", friendsIds: ["0"], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "6", firstName: "Thomas", familyName: "Shelby", email: "thomas.shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "story3", age: 43, gerder: "male", friendsIds: ["0"], friendsRequestsIDs: [], isCurrentUser: false),
        .init(id: "7", firstName: "Nancy", familyName: "Wheeler", email: "nancy.wheeler@gmail.com", profileImageName: "profilePic4", coverImageName: "story4", age: 27, gerder: "female", friendsIds: ["0"], friendsRequestsIDs: [], isCurrentUser: false)
    ]
    
    @Published var friends: [User] = []
    
    @Published var posts: [Post] = [
        .init(id: "0", userId: "3", postTitle: "Best team ever", postLikes: 2, postShares: 2, postUrl: "team", isVideo: false),
        .init(id: "1", userId: "0", postTitle: "Just hurd work every day 😉", postLikes: 3, postShares: 4, postUrl: "cover_picture", isVideo: false)
    ]
    
    @Published var myPostIndexes: [Int] = []
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(fromItem: selectedImage)}
        }
    }
    @Published var selectedCoverImage: PhotosPickerItem? {
        didSet {
            Task { try await loadCoverImage(fromItem: selectedCoverImage)}
        }
    }
    @Published var profileImage: Image = Image("no_profile")
    @Published var coverImage: Image = Image("no_profile")
    private var uiImage: UIImage?
    
    init() {
        setupFriends()
        setupPosts()
    }
    
    private func setupFriends() {
        self.friends = users.filter { self.users[0].friendsIds.contains($0.id)}
    }
    
    private func setupPosts() {
        for index in (0 ..< posts.count) {
            posts[index].user = users.first(where: { $0.id == posts[index].userId })
            if posts[index].user == users[0] {
                myPostIndexes.append(index)
            }
        }
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA ERROR"); return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func loadCoverImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA ERROR"); return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
    }
}
 
