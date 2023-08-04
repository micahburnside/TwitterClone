//
//  ProfileDataFormViewViewModel.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/2/23.
//

import Foundation
import UIKit
import Combine
import FirebaseStorage

final class ProfileDataFormViewViewModel: ObservableObject {
    
    private var subscriptions: Set<AnyCancellable> = []
    
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
    @Published var imageData: UIImage?
    @Published var isFormValid: Bool = false
    @Published var error: String = ""


    func validateProfileForm() {
        guard let displayName = displayName,
              displayName.count > 2,
              let username = username,
              username.count > 2,
              let bio = bio,
              bio.count > 2,
              imageData != nil else {
            isFormValid = false
            return
        }
        isFormValid = true
    }
    
    func uploadAvatar() {
        
        let randomID = UUID().uuidString
        guard let imageData = imageData?.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        StorageManager.shared.uploadProfilePhoto(with: randomID, image: imageData, metaData: metaData)
            .flatMap({ [weak self] metaData in
                StorageManager.shared.getDowloadURL(for: metaData.path)
            })
            .sink { [weak self] completion in

                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                case .finished:
                    self?.updateUserData()
                }
            } receiveValue: { [weak self] url in
                //converts url object to a String
                self?.avatarPath = url.absoluteString
            }
            .store(in: &subscriptions)
    }
    
    private func updateUserData() {
        guard let displayName,
              let username,
              let bio,
              let avatarPath else { return }
        
    }
}

