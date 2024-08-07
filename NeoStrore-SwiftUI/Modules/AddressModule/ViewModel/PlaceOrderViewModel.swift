//
//  PlaceOrderViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/6/24.
//

import Foundation
import SwiftUI

final class PlaceOrderViewModel:ObservableObject{
    
    @AppStorage("accessToken") private var accessToken: String?
    @Published var placeOrderModel:PlaceOrderModel?
    
    func placeOrder(address:String,completion:@escaping (Bool)->()){
        if let accessToken = accessToken{
            NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/order")!, method: .post, params: nil, headers: ["access_token":accessToken], body: ["address":address], bodyType: .urlEncoded) { result in
                switch result{
                case .success(let data):
                    do{
                        let json = try JSONDecoder().decode(PlaceOrderModel.self, from: data)
                        DispatchQueue.main.async{
                            self.placeOrderModel = json
                            completion(true)
                            print(json)
                        }
                    }
                    catch(let error){
                        print("Error Decoding from the model \(error)")
                        completion(false)
                    }
                case .failure(_):
                    completion(false)
                    print("Error calling API")
                }
            }
        }
    }
}
