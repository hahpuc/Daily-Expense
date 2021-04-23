//
//  LoginInInfo.swift
//  DailyExpense
//
//  Created by Long Nguyễn on 23/04/2021.
//

import UIKit

struct LoginInInfo: Decodable {
    let status: Int
    let message: String
    let profileData: ProfileData
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case profileData = "data"
    }
}

struct ProfileData: Decodable {
    let token: String
    let profile: Profile
}

struct Profile: Decodable {
    let id: Int
    let username: String
    let name: String
    let phone: String
}
