//
//  RegisterViewController.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 18/01/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Variables
    
    let welcomeLabel = UILabel(text: "Create Account", font: .boldSystemFont(ofSize: 34))
    
    let signInLabel = UILabel(text: "Sign up to get started!\n", font: .boldSystemFont(ofSize: 17), numberOfLines: 2, color: #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1))
    
    let emailTextField = UITextField(placeholder: "Email", font: .systemFont(ofSize: 17))
    
    
    let emailSeparateLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        return line
    }()
    
    let passwordTextField = UITextField(placeholder: "Password", font: .systemFont(ofSize: 17))
    
    let passwordSeparateLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        return line
    }()

    let usernameTextField = UITextField(placeholder: "Username", font: .systemFont(ofSize: 17))
    
    let usernameSeparateLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        return line
    }()
    
    let signInButton = UIButton(title: "Sign In", color: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1), radius: 20, textColor: .white)

    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpTitleLabel()
        setUpInputTextField()
        setUpSignInButton()
        
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
    }
    
    // MARK: - Set up Handle
    
    @objc func handleSignIn() {
        print("Sign in")
        
        
    }
    
    @objc func changeToSignUp() {
        print("Change to sign up")
        
        let registerVC = RegisterViewController()
        registerVC.modalTransitionStyle = .coverVertical
        
        self.present(registerVC, animated: true, completion: nil)
    }
    
    // MARK: - Set up Component
    
    func setUpTitleLabel() {
        view.addSubview(welcomeLabel)
        view.addSubview(signInLabel)
        
        welcomeLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 150, left: 16, bottom: 0, right: 16))
        welcomeLabel.constrainHeight(constant: 41)
        
        signInLabel.anchor(top: welcomeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        signInLabel.constrainHeight(constant: 44)
        signInLabel.textAlignment = .justified
    }
    
    func setUpInputTextField() {
        
        view.addSubview(usernameTextField)
        view.addSubview(usernameSeparateLine)
        
        view.addSubview(emailTextField)
        view.addSubview(emailSeparateLine)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSeparateLine)
        
        usernameTextField.anchor(top: signInLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 50, left: 16, bottom: 0, right: 16))
        usernameTextField.constrainHeight(constant: 60)
        
        
        usernameSeparateLine.constrainHeight(constant: 1)
        usernameSeparateLine.anchor(top: usernameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        emailTextField.anchor(top: usernameSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        emailTextField.constrainHeight(constant: 60)
        
        emailSeparateLine.constrainHeight(constant: 1)
        emailSeparateLine.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        passwordTextField.anchor(top: emailSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        passwordTextField.constrainHeight(constant: 60)
        
        passwordSeparateLine.constrainHeight(constant: 1)
        passwordSeparateLine.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        
    }
    
    func setUpSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        signInButton.centerXInSuperview()
        signInButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 109, right: 16))
        signInButton.constrainHeight(constant: 50)
    }
}
