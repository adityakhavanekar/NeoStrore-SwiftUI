//
//  EditCartModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/5/24.
//

import Foundation

// MARK: - EditCartModel
struct EditCartModel: Codable {
    let status: Int
    let data: Bool
    let totalCarts: Int
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, data
        case totalCarts = "total_carts"
        case message
        case userMsg = "user_msg"
    }
}
