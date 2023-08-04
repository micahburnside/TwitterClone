//
//  StorageManager.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/3/23.
//

import Foundation
import FirebaseStorageCombineSwift
import Combine
import FirebaseStorage

enum FirestorageError: Error {
    case invalidStorageID
}

final class StorageManager {
    static let shared = StorageManager()
    
    let storage = Storage.storage()
    
    func getDowloadURL(for id: String?) -> AnyPublisher<URL, Error> {
        guard let id = id else {
            return Fail(error: FirestorageError.invalidStorageID)
                .eraseToAnyPublisher()
        }
        return storage
        
            .reference(withPath: id)
            .downloadURL()
            .print()
            .eraseToAnyPublisher()
    }
    
    func uploadProfilePhoto(with randomID: String, image: Data, metaData: StorageMetadata) -> AnyPublisher<StorageMetadata, Error> {
        storage
            .reference()
            .child("images/\(randomID).jpg") // Add "images/" before the randomID
            .putData(image, metadata: metaData)
            .print()
            .eraseToAnyPublisher()
    }
    
}
