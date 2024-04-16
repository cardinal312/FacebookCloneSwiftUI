//
//  VideoUploader.swift
//  FacebookClone
//
//  Created by Macbook on 16/4/24.
//

import Foundation
import FirebaseStorage

struct VideoUploader {
    
    static func uploadVideo(data: Data) async throws -> String? {
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference().child("/post_video/\(fileName)")
        let metaData = StorageMetadata()
        metaData.contentType = "video/quicktime"
        do {
            let _ = try await ref.putDataAsync(data, metadata: metaData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload video to db \(error)")
            return nil
        }
    }
}
