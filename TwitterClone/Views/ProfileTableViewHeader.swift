//
//  ProfileTableViewHeader.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/1/23.
//

import UIKit

class ProfileTableViewHeader: UIView {

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
        
        configureConstraints()
    }
    private func configureConstraints() {
            let profileHeaderImageViewConstraints = [
                profileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
                profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                profileHeaderImageView.heightAnchor.constraint(equalToConstant: 180)
            ]
        
        NSLayoutConstraint.activate(profileHeaderImageViewConstraints)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
