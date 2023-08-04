//
//  Tweet.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/4/23.
//

import Foundation

struct Tweet: Codable, Identifiable {
    var id = UUID().uuidString
    let authorID: String
    let author: TwitterUser
    let tweetContent: String
    var likeCount: Int
    var likers: [String]
    let isReply: Bool
    let parentRefernce: String?
    
}
