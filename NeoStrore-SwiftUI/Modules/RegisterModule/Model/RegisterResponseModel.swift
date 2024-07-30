//
//  RegisterResponseModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/8/24.
//

import Foundation

// MARK: - RegisterResponseModel
struct RegisterResponseModel: Decodable {
    let status: Int
    let data: DataClass
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, data, message
        case userMsg = "user_msg"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, roleID: Int?
    let firstName, lastName, email, username: String?
    let profilePic, countryID: Data?
    let gender, phoneNo: String?
    let dob: Date?
    let isActive: Bool?
    let created, modified: String?
    let accessToken: String?

    enum CodingKeys: String, CodingKey {
        case id 
        case roleID = "role_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email, username
        case profilePic = "profile_pic"
        case countryID = "country_id"
        case gender
        case phoneNo = "phone_no"
        case dob
        case isActive = "is_active"
        case created, modified
        case accessToken = "access_token"
    }
}
