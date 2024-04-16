//
//  FeedViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI
import PhotosUI
import Combine
import Firebase

@MainActor
final class FeedViewModel: ObservableObject {
    
    @Published var friends: [User] = []
    @Published var posts: [Post] = []
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
    @Published var selectedCreatePostImage: PhotosPickerItem? {
        didSet {
            Task { try await loadCreatePostImage(fromItem: selectedCreatePostImage)}
        }
    }
    @Published var selectedVideo: PhotosPickerItem? {
        didSet {
            Task { try await loadVideo() }
        }
    }
    @Published var profileImage: Image = Image(.noProfile)
    @Published var coverImage: Image = Image(.noProfile)
    @Published var creaPostImage: Image?
    @Published var createdVideoUrl: URL?
    @Published var currenUser: User?
    @Published var mindText: String = ""
    @Published var showCreatePostPicker: Bool = false
    private var cancellables = Set<AnyCancellable>()
    private var uiImage: UIImage?
    private var videoData: Data?
    
    init() {
        UserService.shared.$currentUser.sink { [weak self] currentUser in
                self?.currenUser = currentUser
            }.store(in: &cancellables)
        setupFriends()
        Task {
            posts = try await PostService.fetchFeedPost()
            guard let uid = Auth.auth().currentUser?.uid else { return }
            myPostIndexes = posts.enumerated().filter { $0.element.userId == uid }.map { $0.offset }
        }
    }
    
    private func setupFriends() {
        UserService.shared.$friends.sink { [weak self] friends in
            self?.friends = friends ?? []
        }
        .store(in: &cancellables)
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA ERROR"); return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        try await updateProfileImageName()
    }
    
    func loadCoverImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA ERROR"); return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
        try await updateCoverImageName()
    }
    
    func loadVideo() async throws {
        guard let item = selectedVideo else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA VIDEO ERROR"); return }
        print("Video -->> \(data) <--") //MARK: - Just catch video url
        self.videoData = data
        //VideoUploader.uploadVideo(data: videoData)
        createdVideoUrl = saveDataToTemporaryDirectory(data: data)
    }
    
    func loadCreatePostImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { print("DATA ERROR"); return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.creaPostImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImageName() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.uploadProfileImage(withImageUrl: imageUrl)
        self.currenUser?.profileImageName = imageUrl
    }
    
    private func updateCoverImageName() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadCoverImage(image) else { return }
        try await UserService.shared.uploadCoverImage(withImageUrl: imageUrl)
        self.currenUser?.coverImageName = imageUrl
    }
    
    func uploadPost() async throws {
        if let createdVideoUrl = createdVideoUrl {
            guard let videoData = videoData else { return }
            try await PostService.uploadVideoPost(postTitle: mindText, data: videoData)
            cleanupTemporaryFile(url: createdVideoUrl)
        } else {
            try await PostService.uploadPost(postTitle: mindText, uiImage: uiImage)
        }
    }
    
    private func saveDataToTemporaryDirectory(data: Data) -> URL {
        do {
            let fileUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("video.mp4")
            try data.write(to: fileUrl)
            return fileUrl
        } catch {
            fatalError("Failed to save video to temporary directory -->> \(error)")
        }
    }
    
    func cleanupTemporaryFile(url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
            createdVideoUrl = nil
            mindText = ""
        } catch {
            fatalError("Failed to remove video \(error)")
        }
    }
}
 
