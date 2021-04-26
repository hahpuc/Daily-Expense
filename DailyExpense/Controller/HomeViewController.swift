//
//  HomeViewController.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 23/04/2021.
//

import UIKit
import Alamofire
 
class HomeViewController: UIViewController {
    
    var username: String?
    
    var accessToken: String?
    
    var selectedImage: UIImage?
    var imageURL: NSURL?
    
    var label = UILabel(text: "Welcome", font: .systemFont(ofSize: 30), numberOfLines: 1, color: .black)
    
    let oldPasswordTextField = UITextField(placeholder: "Old Password", font: .systemFont(ofSize: 17))
    let newPasswordTextField = UITextField(placeholder: "New Password", font: .systemFont(ofSize: 17))
    let confirmPasswordTextField = UITextField(placeholder: "Confirm Password", font: .systemFont(ofSize: 17))
    
    let oldPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    let newPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    let confirmPasswordSeparateLine = UIView(backgroundColor: #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
    
    let imagePicker = UIImageView(cornerRadius: 50)
    
    let changePasswordButton = UIButton(title: "Change Password", color: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1), radius: 20, textColor: .white)
    let chooseImageButton = UIButton(title: "Choose Image", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), radius: 20, textColor: .white)
    let uploadImageButton = UIButton(title: "Upload Image", color: #colorLiteral(red: 1, green: 0.5137254902, blue: 0.6274509804, alpha: 1), radius: 20, textColor: .white)
    
    
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
        view.addSubview(imagePicker)
        view.addSubview(chooseImageButton)
        view.addSubview(uploadImageButton)
        
        label.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 16, bottom: 0, right: 16))
        
        oldPasswordTextField.anchor(top: label.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        oldPasswordSeparateLine.anchor(top: oldPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        newPasswordTextField.anchor(top: oldPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        newPasswordSeparateLine.anchor(top: newPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        confirmPasswordTextField.anchor(top: newPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        confirmPasswordSeparateLine.anchor(top: confirmPasswordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 1))
        
        changePasswordButton.anchor(top: confirmPasswordSeparateLine.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        imagePicker.centerXInSuperview()
        imagePicker.anchor(top: changePasswordButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        
        chooseImageButton.anchor(top: imagePicker.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        uploadImageButton.anchor(top: chooseImageButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
    }
    
    func setUpAction() {
        changePasswordButton.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
        
        chooseImageButton.addTarget(self, action: #selector(handleChoosePicture), for: .touchUpInside)
        
        uploadImageButton.addTarget(self , action: #selector(handleUploadImage), for: .touchUpInside)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @objc func handleUploadImage() {
        print("Upload Image")
        
        let urlString = "https://stag-pernodricard.fractal.vn/api/v1/upload-image"
        
        let parameters = [
            "outlet_id": "150"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken!)",
            "Accept": "application/json"
        ]
        
        if let imageData = selectedImage?.pngData() {
            let filename = getDocumentsDirectory().appendingPathComponent(imageURL?.absoluteString ?? "")
            try? imageData.write(to: filename)
            
            AF.upload(multipartFormData: { (multipartFromData) in
                for (key, value) in parameters {
                    multipartFromData.append(value.data(using: .utf8)!, withName: key)
               }
                multipartFromData.append(imageData, withName: "img", fileName: self.imageURL?.absoluteString, mimeType: "image/png")
               
            }, to: urlString, method: .post, headers: headers).responseJSON { (response) in
                switch response.result {
                    case.success:
                        print(response)
                        
                        guard let data = response.data else {return}

                        do {
                            let object = try JSONDecoder().decode(InfoRequest.self, from: data)
                            
                            let alert = UIAlertController(title: "Thông báo", message: object.message, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        } catch {
                            let alert = UIAlertController(title: "Error", message: "Thất bại upload hình", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    
                        
                    case let .failure(error):
                        print("2", error)
                    
                }
            }
        }
    }
    
    func upload(image: Data, to url: Alamofire.URLRequestConvertible, params: [String: Any], header: HTTPHeaders) {
        
    }
    
    @objc func handleChoosePicture() {
        print("Choose Image")
        
        showImagePicker()
    }
    
    @objc func handleChangePassword() {
        print("Change Pass")
            
        let urlString = "https://stag-pernodricard.fractal.vn/api/v1/change-password"
        
        let parameters = [
            "old_pass": "\(oldPasswordTextField.text ?? "")",
            "new_pass": "\(newPasswordTextField.text ?? "")",
            "confirm_pass": "\(confirmPasswordTextField.text ?? "")"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken!)",
            "Accept": "application/json"
        ]
        
        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).validate().responseJSON { (response) in
            switch response.result {
                case.success:
                    print(response)
                    
                    guard let data = response.data else {return}

                    do {
                        let object = try JSONDecoder().decode(InfoRequest.self, from: data)
                        
                        let alert = UIAlertController(title: "Thông báo", message: object.message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                    } catch {
                        let alert = UIAlertController(title: "Error", message: "Thất bại", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                
                    
                case let .failure(error):
                    print("2", error)
                
            }
        }
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePicker() {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imagePicker.image = editedImage
            selectedImage = editedImage
            imageURL = (info[UIImagePickerController.InfoKey.imageURL] as! NSURL)
            
            
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePicker.image = originImage
            selectedImage = originImage
            imageURL = (info[UIImagePickerController.InfoKey.imageURL] as! NSURL)
        }
        
        print(selectedImage)
        print(imageURL)
        
        dismiss(animated: true, completion: nil)
    }
}
