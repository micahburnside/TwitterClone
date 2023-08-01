//
//  TweetTableViewCellDelegate.swift
//  TwitterClone
//
//  Created by Micah Burnside on 7/31/23.
//

import Foundation

protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableCellDidTapReply()
    func tweetTableCellDidTapRetweet()
    func tweetTableCellDidTapLike()
    func tweetTableCellDidTapShare()

}
