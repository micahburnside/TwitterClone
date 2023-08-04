//
//  HomeViewViewModel.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/2/23.
//

import Foundation
import Combine
import FirebaseAuth


final class HomeViewViewModel: ObservableObject {
    @Published var user: TwitterUser?
    @Published var error: String = ""
    @Published var tweets: [Tweet] = []

    
    private var subsriptions: Set<AnyCancellable> = []
    
    
    
    func retreiveUser() {
        guard let id = Auth.auth().currentUser?.uid else { return }
        DataBaseManager.shared.collectionUsers(retreive: id)
            .handleEvents(receiveOutput: { [weak self] user in
                self?.user = user
                self?.fetchTweets()
            })
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subsriptions)
    }
    
    func fetchTweets() {
        guard let userID = user?.id else { return }
        DataBaseManager.shared.collectionTweets(retreiveTweets: userID)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] retreivedTweets in
                self?.tweets = retreivedTweets
            }
            .store(in: &subsriptions)
    }
}
