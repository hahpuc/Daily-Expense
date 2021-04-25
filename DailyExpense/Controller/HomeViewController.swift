//
//  HomeViewController.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 23/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var username: String?
    
    var label = UILabel(text: "Welcome", font: .systemFont(ofSize: 30), numberOfLines: 1, color: .black)
    
    let oldPasswordTextField = UITextField(placeholder: "Old Password", font: .systemFont(ofSize: 17))
    let newPasswordTextField = UITextField(placeholder: "New Password", font: .systemFont(ofSize: 17))
    let confirmPasswordTextField = UITextField(placeholder: "Confirm Password", font: .systemFont(ofSize: 17))
    
    let oldPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    let newPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    let confirmPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    
    let changePasswordButton = UIButton(title: "Change Password", color: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1), radius: 20, textColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        label.text = "Welcome " + (username ?? "")
        
        setUpLayout()
        setUpAction()
    }
    
    func setUpLayout() {
        
        view.addSubview(label)
        view.addSubview(oldPasswordTextField)
        view.addSubview(oldPasswordSeparateLine)
        view.addSubview(newPasswordTextField)
        view.addSubview(newPasswordSeparateLine)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(confirmPasswordSeparateLine)
        view.addSubview(changePasswordButton)
        
        label.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 16, bottom: 0, right: 16))
        
        oldPasswordTextField.anchor(top: label.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        oldPasswordSeparateLine.anchor(top: oldPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        newPasswordTextField.anchor(top: oldPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        newPasswordSeparateLine.anchor(top: newPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        confirmPasswordTextField.anchor(top: newPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        confirmPasswordSeparateLine.anchor(top: confirmPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        
        changePasswordButton.anchor(top: confirmPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
    }
    
    func setUpAction() {
        changePasswordButton.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
    }
    
    @objc func handleChangePassword() {
        print("Change Pass")
    }
}
