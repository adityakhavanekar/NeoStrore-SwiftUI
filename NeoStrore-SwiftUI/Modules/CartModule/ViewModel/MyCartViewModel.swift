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
                        }
                        print(accessToken)
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
        }else{}
    }
}
