//
//  ChangePassword.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 27/04/2021.
//

import UIKit
import Alamofire

class ChangePasswordScreen: UIViewController {
    
    var accessToken: String? 
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ChangePass", accessToken!)
    }
    
    @IBAction func handleChangePassword(_ sender: Any) {
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
