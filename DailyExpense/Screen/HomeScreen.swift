//
//  HomeScreen.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 27/04/2021.
//

import UIKit

class HomeScreen: UIViewController {
    
    var accessToken: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    @IBAction func handleChangePassword(_ sender: Any) {
//        performSegue(withIdentifier: "changePasswordSegue", sender: self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ChangePasswordScreen {
            let vc = segue.destination as? ChangePasswordScreen
            
            vc?.accessToken = self.accessToken!
        }
        
        if segue.destination is UploadImageScreen {
            let vc = segue.destination as? UploadImageScreen
            vc?.accessToken = self.accessToken!
        }
    }
}
