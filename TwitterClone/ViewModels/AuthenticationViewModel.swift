//
//  AuthenticationViewModel.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/1/23.
//

import Foundation
import Firebase
import Combine

final class AuthenticationViewModel: ObservableObject {
    
    //Combine Framework.
    @Published var email: String?
    @Published var password: String?
    @Published var isAuthenticationFormValid: Bool = false
    @Published var user: User?
    
    private var subscriptions: Set<AnyCancellable> = []

    func validateAuthenticationForm() {
        guard let email = email,
              let password = password else {
            isAuthenticationFormValid = false
            return
        }
        isAuthenticationFormValid = isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email,
              let password = password else { return }
        // returns a publisher we can subscribe to
        AuthManager.shared.registeruser(with: email, password: password)
            .sink { _ in
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
        
            .store(in: &subscriptions)
    }
    
    func loginUser() {
        guard let email = email,
              let password = password else { return }
        // returns a publisher we can subscribe to
        AuthManager.shared.loginUser(with: email, password: password)
            .sink { _ in
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
        
            .store(in: &subscriptions)
    }
}
