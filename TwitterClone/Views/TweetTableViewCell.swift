//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by Micah Burnside on 7/31/23.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    weak var delegate: TweetTableViewCellDelegate?
    
    static let identifier = "TweetTableViewCell"
    
    private let actionSpacing: CGFloat = 50
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(systemName: "person")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.layer.masksToBounds = true
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .red
        return avatarImageView
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rusty Shackleford"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@RustyShackleford"
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweetTextContentLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a fake Tweet. It will take up multiple lines, I believe this is enough text. I have never seen a thin person drinking Diet Coke."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "replyIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "retweetIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "likeIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "shareIcon"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }
    
    @objc private func didTapReply() {
        delegate?.tweetTableCellDidTapReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.tweetTableCellDidTapRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableCellDidTapLike()
        likeButton.tintColor = .red
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableCellDidTapShare()
    }
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)

    }
    
    private func configureConstraints() {
        let avatarImageViewConstraints = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            displayNameLabel.trailingAnchor.constraint(equalTo: usernameLabel.leadingAnchor, constant: 6),

        ]
        
        let usernameLabelConstraints = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        let tweetContextLabelConstraints = [
            tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
            tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ]
        
        let replyButtonConstraints = [
            replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]
        
        let retweetButtonConstraints = [
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
            retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
        ]
        
        let shareButtonConstraints = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(tweetContextLabelConstraints)
        NSLayoutConstraint.activate(replyButtonConstraints)
        NSLayoutConstraint.activate(shareButtonConstraints)
        NSLayoutConstraint.activate(retweetButtonConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
