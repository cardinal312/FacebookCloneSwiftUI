//
//  PostService.swift
//  FacebookClone
//
//  Created by Macbook on 9/4/24.
//

import SwiftUI
import Firebase

struct PostService {
    
    static func uploadPost(postTitle: String, uiImage: UIImage?) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadCreatePostImage(uiImage) else { return }
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID, userId: uid, postTitle: postTitle, postLikes: 2, postShares: 3, postUrl: imageUrl, isVideo: false, timesTamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
}
