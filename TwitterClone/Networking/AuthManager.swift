//
//  AuthManager.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/1/23.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine


class AuthManager {
    static let shared = AuthManager()
    
    func registeruser(with email: String, password: String) -> AnyPublisher<User, Error> {
       return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}


