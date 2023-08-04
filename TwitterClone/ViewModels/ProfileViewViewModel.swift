//
//  ProfileViewViewModel.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/4/23.
//

import Foundation
import Combine
import FirebaseAuth


final class ProfileViewViewModel: ObservableObject {
    
    @Published var user: TwitterUser?
    @Published var error: String = ""
    
    private var subsriptions: Set<AnyCancellable> = []
    
    
    
    func retreiveUser() {
        guard let id = Auth.auth().currentUser?.uid else { return }
        DataBaseManager.shared.collectionUsers(retreive: id)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subsriptions)
    }


}
