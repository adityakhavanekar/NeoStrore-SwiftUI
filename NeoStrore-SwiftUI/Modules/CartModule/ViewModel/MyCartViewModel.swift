//
//  MyCartViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/5/24.
//

import Foundation
import SwiftUI

final class MyCartViewModel:ObservableObject{
    
    @AppStorage("accessToken") private var accessToken: String?
    @Published var editCartModel:EditCartModel?
    @Published var myCartModel: MyCartModel?
    
    func getMyCartList(completion:@escaping (Bool)->()){
        if let accessToken{
            NetworkManager.shared.request(url: URL(string:"http://staging.php-dev.in:8844/trainingapp/api/cart")!, method: .get, params: nil, headers:["access_token":accessToken] , body:nil){
                result in
                switch result{
                case .success(let data):
                    do {
                        let json = try JSONDecoder().decode(MyCartModel.self, from: data)
                        DispatchQueue.main.async{
                            self.myCartModel = json
                            completion(true)
                        }
                        print(accessToken)
                        print(json)
                    }catch{
                        print("Failed to decode JSON: \(error)")
                        completion(false)
                    }
                case .failure(_):
                    print("Failure")
                }
            }
        }else{}
    }
    
    func updateCartProduct(productId:Int,quantity:Int,completion:@escaping (Bool)->()){
        if let accessToken = accessToken{
            NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/editCart")!, method: .post, params: nil, headers: ["access_token":accessToken], body: ["product_id":productId,"quantity":quantity], bodyType: .urlEncoded) { result in
                switch result{
                case .success(let data):
                    do{
                        let json = try JSONDecoder().decode(EditCartModel.self, from: data)
                        DispatchQueue.main.async {
                            self.editCartModel = json
                            completion(true)
                        }
                    }
                    catch(let error){
                        print("Error Decoding Data \(error)")
                    }
                case .failure(_):
                    print("Error sending Request")
                }
            }
        }
        
    }
}
