//
//  ProfileTableViewHeader.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/1/23.
//

import UIKit

class ProfileTableViewHeader: UIView {

    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rusty"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "header")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)


        configureConstraints()
    }
    private func configureConstraints() {
            let profileHeaderImageViewConstraints = [
                profileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
                profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                profileHeaderImageView.heightAnchor.constraint(equalToConstant: 180)
            ]
        
            let profileAvatarImageViewConstraints = [
                profileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                profileAvatarImageView.centerYAnchor.constraint(equalTo: profileHeaderImageView.bottomAnchor, constant: 10),
                profileAvatarImageView.widthAnchor.constraint(equalToConstant: 80),
                profileAvatarImageView.heightAnchor.constraint(equalToConstant: 80)
            ]
        
        let displayNameLabelConstraints = [
            displayNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImageView.leadingAnchor),
            displayNameLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(profileHeaderImageViewConstraints)
        NSLayoutConstraint.activate(profileAvatarImageViewConstraints)
        NSLayoutConstraint.activate(displayNameLabelConstraints)


    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
