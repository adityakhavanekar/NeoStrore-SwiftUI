//
//  ProductBuyViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/3/24.
//

import Foundation
import SwiftUI

final class ProductBuyViewModel:ObservableObject{
    
    @AppStorage("accessToken") private var accessToken: String?
    @Published var addToCartModel: ProductAddToCartModel?
    
    func buyProduct(productId:Int,quantity:Int,completion:@escaping (Bool)->()){
        if let accessToken{
            NetworkManager.shared.request(url: URL(string:"http://staging.php-dev.in:8844/trainingapp/api/addToCart")!, method: .post, params: nil, headers:["access_token":accessToken] , body: ["product_id":"\(productId)","quantity":"\(quantity)"], bodyType: .urlEncoded){
                result in
                switch result{
                case .success(let data):
                    do {
                        let json = try JSONDecoder().decode(ProductAddToCartModel.self, from: data)
                        DispatchQueue.main.async{
                            self.addToCartModel = json
                        }
                        completion(true)
                        print(json)
                    }catch{
                        print("Failed to decode JSON: \(error)")
                        completion(false)
                    }
                case .failure(_):
                    print("Failure")
                }
            }
        }else{
            
        }
        
    }
}
