//
//  ProfileDataFormViewController.swift
//  TwitterClone
//
//  Created by Micah Burnside on 8/2/23.
//

import UIKit

class ProfileDataFormViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .onDrag
        return scrollView
    }()
    
    private let displayNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.backgroundColor = .secondarySystemFill
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.attributedPlaceholder = NSAttributedString(string: "Display Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }()
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.backgroundColor = .secondarySystemFill
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 8
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }()
    
    private let hintLabel: UILabel = {
        let hintLabel = UILabel()
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.font = .systemFont(ofSize: 32, weight: .bold)
        hintLabel.textColor = .label
        hintLabel.text = "Fill in your data"
        return hintLabel
    }()
    
    private let avatarPlaceholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage(systemName: "camera.fill")
        imageView.tintColor = .gray
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .secondarySystemFill
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 8
        textView.textContainerInset = .init(top: 15, left: 15, bottom: 15, right: 15)
        textView.text = "Tell the world about yourself"
        textView.textColor = .gray
        textView.font = .systemFont(ofSize: 16)
        return textView
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(hintLabel)
        scrollView.addSubview(avatarPlaceholderImageView)
        scrollView.addSubview(displayNameTextField)
        scrollView.addSubview(userNameTextField)
        scrollView.addSubview(bioTextView)
        scrollView.addSubview(submitButton)
        displayNameTextField.delegate = self
        userNameTextField.delegate = self
        bioTextView.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        configureConstraints()
    }
    
    @objc private func didTapToDismiss() {
        view.endEditing(true)
    }
    
    private func configureConstraints() {
        let scrollViewConstraints = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let hintLabelConstraints = [
            hintLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            hintLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30)
        ]
        
        let avatarPlaceholderImageViewConstraints = [
            avatarPlaceholderImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatarPlaceholderImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarPlaceholderImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarPlaceholderImageView.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 30)
        ]
        
        let displayNameTextFieldConstraints = [
            displayNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            displayNameTextField.topAnchor.constraint(equalTo: avatarPlaceholderImageView.bottomAnchor, constant: 40),
            displayNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let usernameTextFieldConstraints = [
            userNameTextField.leadingAnchor.constraint(equalTo: displayNameTextField.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: displayNameTextField.trailingAnchor),
            userNameTextField.topAnchor.constraint(equalTo: displayNameTextField.bottomAnchor, constant: 20),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let bioTextViewConstraints = [
            bioTextView.leadingAnchor.constraint(equalTo: displayNameTextField.leadingAnchor),
            bioTextView.trailingAnchor.constraint(equalTo: displayNameTextField.trailingAnchor),
            bioTextView.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            bioTextView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let submitButtonConstraints = [
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(hintLabelConstraints)
        NSLayoutConstraint.activate(avatarPlaceholderImageViewConstraints)
        NSLayoutConstraint.activate(displayNameTextFieldConstraints)
        NSLayoutConstraint.activate(usernameTextFieldConstraints)
        NSLayoutConstraint.activate(bioTextViewConstraints)
        NSLayoutConstraint.activate(submitButtonConstraints)

    }
}

extension ProfileDataFormViewController: UITextViewDelegate, UITextFieldDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: textView.frame.origin.y - 100), animated: true)
        if textView.textColor == .gray {
            textView.textColor = .label
            textView.text = ""
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        if textView.text.isEmpty == true {
            textView.text = "Tell the world about yourself"
            textView.textColor = .gray
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: textField.frame.origin.y - 100), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
