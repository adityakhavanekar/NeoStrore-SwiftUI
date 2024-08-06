//
//  PlaceOrderModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/6/24.
//

import Foundation
struct PlaceOrderModel: Codable {
    let status: Int
    let message, userMsg: String

    enum CodingKeys: String, CodingKey {
        case status, message
        case userMsg = "user_msg"
    }
}
