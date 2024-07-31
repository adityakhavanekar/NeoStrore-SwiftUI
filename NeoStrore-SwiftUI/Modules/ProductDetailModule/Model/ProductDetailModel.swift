//
//  ProductDetailModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/30/24.
//
import Foundation

// MARK: - ProductDetailModel
struct ProductDetailModel: Codable {
    let status: Int
    let data: ProductDataClass
}

// MARK: - DataClass
struct ProductDataClass: Codable {
    let id, productCategoryID: Int?
    let name, producer, description: String?
    let cost, rating, viewCount: Int?
    let created, modified: String?
    let productImages: [ProductImage]

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
}

// MARK: - ProductImage
struct ProductImage: Codable, Identifiable {
    let id, productID: Int
    let image: String
    let created, modified: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case image, created, modified
        
    }
}
