//
//  HomeViewController.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 23/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var label = UILabel(text: "HELLO", font: .systemFont(ofSize: 30), numberOfLines: 1, color: .systemPink)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(label)
        
        label.centerXInSuperview()
        label.centerYInSuperview()
    }
}
