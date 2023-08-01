//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by Micah Burnside on 7/31/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
}

extension HomeViewController: TweetTableViewCellDelegate {
    func tweetTableCellDidTapReply() {
        print("Reply")
    }
    
    func tweetTableCellDidTapRetweet() {
        print("Retweet")

    }
    
    func tweetTableCellDidTapLike() {
        print("Like")

    }
    
    func tweetTableCellDidTapShare() {
        print("Share")

    }
    
    
}
