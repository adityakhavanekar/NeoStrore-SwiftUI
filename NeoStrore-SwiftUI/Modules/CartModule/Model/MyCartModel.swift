//
//  MyCartModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/5/24.
//

import Foundation
struct MyCartModel: Codable {
    let status: Int
    let data: [MyCartData]?
    let count, total: Int?
}

// MARK: - Datum
struct MyCartData: Codable {
    let id, productID, quantity: Int
    let product: MyCartProduct

    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case quantity, product
    }
}

// MARK: - Product
struct MyCartProduct: Codable {
    let id: Int
    let name: String
    let cost: Int
    let productCategory: String
    let productImages: String
    let subTotal: Int

    enum CodingKeys: String, CodingKey {
        case id, name, cost
        case productCategory = "product_category"
        case productImages = "product_images"
        case subTotal = "sub_total"
    }
}
