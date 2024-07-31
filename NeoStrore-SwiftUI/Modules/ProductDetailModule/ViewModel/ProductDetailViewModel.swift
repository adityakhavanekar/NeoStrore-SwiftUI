//
//  ProductDetailViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/30/24.
//

import Foundation

final class ProductDetailViewModel:ObservableObject{
    
    @Published var product: ProductDetailModel?
    
    func getProductDetail(productId:Int,completion:@escaping (Bool)->()){
        NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getDetail?product_id=\(productId)")!){
            result in
            switch result{
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ProductDetailModel.self, from: data)
                    DispatchQueue.main.async{
                        self.product = json
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
