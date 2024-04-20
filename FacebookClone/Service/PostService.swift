//
//  PostService.swift
//  FacebookClone
//
//  Created by Macbook on 9/4/24.
//

import SwiftUI
import Firebase

@MainActor
final class PostService {
    
    static func uploadPost(postTitle: String, uiImage: UIImage?) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadCreatePostImage(uiImage) else { return }
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID, userId: uid, postTitle: postTitle, postLikes: 2, postShares: 3, postUrl: imageUrl, isVideo: false, timesTamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
    
    static func uploadVideoPost(postTitle: String, data: Data) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let videoUrl = try await VideoUploader.uploadVideo(data: data) else { return }
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID, userId: uid, postTitle: postTitle, postLikes: 2, postShares: 3, postUrl: videoUrl, isVideo: true, timesTamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
    
    static func fetchFeedPost(isVideo: Bool) async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").whereField("isVideo", isEqualTo: isVideo).getDocuments()
        var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }
        print("My post ->> \(posts)")
        for i in 0..<posts.count {
            let owneruid = posts[i].userId
            let postUser = try await UserService.fetchUser(withUid: owneruid)
            posts[i].user = postUser
            print("My id ->> \(postUser)")
        }
        return posts.sorted { $0.timesTamp.dateValue() > $1.timesTamp.dateValue()}
    }
}
