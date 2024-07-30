//
//  ProductListingViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/29/24.
//

import Foundation

final class ProductListingViewModel:ObservableObject{
    
    @Published var product: [ProductListingData] = []
    
    func getProductListing(productCategoryId:Int,completion:@escaping (Bool)->()){
        NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=\(productCategoryId)")!){
            result in
            switch result{
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ProductListingModel.self, from: data)
                    DispatchQueue.main.async{
                        self.product = json.data
                    }
                    print(json)
                }catch{
                    print("Failed to decode JSON: \(error)")
                    completion(false)
                }
            case .failure(_):
                print("Failure")
            }
        }
    }
}
