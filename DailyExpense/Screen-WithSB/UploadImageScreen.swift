//
//  UploadImageScreen.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 27/04/2021.
//

import UIKit
import Alamofire

class UploadImageScreen: UIViewController {
    
    var accessToken: String?
    
    var selectedImage: UIImage?
    var imageURL: NSURL?
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var uploadImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handlePickeImage(_ sender: Any) {
        showImagePicker()
    }
    
    @IBAction func handleUploadImage(_ sender: Any) {
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
}

// MARK: - Extension
extension UploadImageScreen: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        
        print(selectedImage as Any)
        print(imageURL as Any)
        
        dismiss(animated: true, completion: nil)
    }
}
