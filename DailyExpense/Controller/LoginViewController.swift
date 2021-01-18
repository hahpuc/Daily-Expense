//
//  LoginViewController.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 18/01/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Variables
    
    let welcomeLabel = UILabel(text: "Welcome!", font: .boldSystemFont(ofSize: 34))
    
    let signInLabel = UILabel(text: "Sign in to continue\nGet your money under control", font: .boldSystemFont(ofSize: 17), numberOfLines: 2, color: #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1))
    
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

    
    let forgotPasswordButton = UIButton(title: "Forgor Password?", textColor: #colorLiteral(red: 1, green: 0.6666666667, blue: 0.7450980392, alpha: 1))
    
    let signInButton = UIButton(title: "Sign In", color: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1), radius: 20, textColor: .white)
    
    let createAccountButton: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Don't have an account?", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8039215686, alpha: 1)]));
        text.append(NSAttributedString(string: " Create Account", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1)]))
        label.attributedText = text
        
        
        return label
    }()
    
//    let createAccountButton = UILabel(text: "Don't have an account? Create account", font: .boldSystemFont(ofSize: 17))
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpTitleLabel()
        
        setUpInputTextField()
    
        setUpSignInButton()
    }
    
    // MARK: - Set up Func
    
    func setUpTitleLabel() {
        view.addSubview(welcomeLabel)
        view.addSubview(signInLabel)
        
        welcomeLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 150, left: 16, bottom: 0, right: 16))
        welcomeLabel.constrainHeight(constant: 41)
        
        signInLabel.anchor(top: welcomeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        signInLabel.constrainHeight(constant: 44)
    }
    
    func setUpInputTextField() {
        view.addSubview(emailTextField)
        view.addSubview(emailSeparateLine)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSeparateLine)
        view.addSubview(forgotPasswordButton)
        
        emailTextField.anchor(top: signInLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 50, left: 16, bottom: 0, right: 16))
        emailTextField.constrainHeight(constant: 60)
        
        
        emailSeparateLine.constrainHeight(constant: 1)
        emailSeparateLine.anchor(top: emailTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        passwordTextField.anchor(top: emailSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        passwordTextField.constrainHeight(constant: 60)
        
        passwordSeparateLine.constrainHeight(constant: 1)
        passwordSeparateLine.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        
        forgotPasswordButton.titleLabel?.font = forgotPasswordButton.titleLabel?.font.boldItalic
        forgotPasswordButton.anchor(top: passwordSeparateLine.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 16))
        
        forgotPasswordButton.constrainHeight(constant: 20)
        
    }
    
    func setUpSignInButton() {
        view.addSubview(createAccountButton)
        view.addSubview(signInButton)
        
        createAccountButton.centerXInSuperview()
        createAccountButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 60, right: 0))
        
        signInButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        signInButton.centerXInSuperview()
        signInButton.anchor(top: nil, leading: view.leadingAnchor, bottom: createAccountButton.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 32, right: 16))
        signInButton.constrainHeight(constant: 50)
    }
    
}


