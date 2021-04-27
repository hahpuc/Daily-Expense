//
//  LoginScreen.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 27/04/2021.
//

import UIKit
import Alamofire

class LoginScreen: UIViewController {
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func handleLogin(_ sender: Any) {
        print("handle LogIn")
        
        let urlString =  "https://stag-pernodricard.fractal.vn/api/v1/login"
        
        let parameters = [
            "phone": "\(phoneTextField.text ?? "" )",
            "password": "\(passwordTextField.text ?? "")"
        ]
        
        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: nil)
            .validate()
            .responseJSON { (responseData) in
                
                switch responseData.result {
                case .success:
                    guard let data = responseData.data else {return}
                    
                    do {
                        let object = try JSONDecoder().decode(LoginInInfo.self, from: data)
                        print(object)
                        
                        let homeController = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeScreen
                        
                        homeController.accessToken = object.profileData.token

                        self.navigationController?.pushViewController(homeController, animated: true)
                        

                        
                    } catch {
                        let alert = UIAlertController(title: "Error", message: "Don't have any Data", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                case let .failure(error):
                    print("2", error)
                    
                }
                
                
            }
        
        
    }
}
