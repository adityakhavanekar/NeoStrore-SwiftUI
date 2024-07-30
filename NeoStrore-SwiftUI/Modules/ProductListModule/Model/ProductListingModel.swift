//
//  ProductListingModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/29/24.
//

import Foundation

// MARK: - ProductListingModel
struct ProductListingModel: Codable {
    let status: Int
    let data: [ProductListingData]
}

// MARK: - Datum
struct ProductListingData: Codable,Identifiable {
    let id, productCategoryID: Int
    let name, producer, description: String
    let cost, rating, viewCount: Int
    let created, modified: String
    let productImages: String

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
}
