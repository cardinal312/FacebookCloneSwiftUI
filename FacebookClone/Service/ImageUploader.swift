//
//  ImageUploader.swift
//  FacebookClone
//
//  Created by Macbook on 7/4/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    private init() {}
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_img/\(fileName)")
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image with error \(error)")
            return nil
        }
    }
    
    static func uploadCoverImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_img/\(fileName)")
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image with error \(error)")
            return nil
        }
    }
    
    
}
