//
//  ProfileDataFormViewViewModel.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/2/23.
//

import Foundation
import Combine

final class ProfileDataFormViewViewModel: ObservableObject {
    
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
    
}
