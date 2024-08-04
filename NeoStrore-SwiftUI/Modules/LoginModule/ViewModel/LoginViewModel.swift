//
//  LoginViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/9/24.
//

import Foundation
import SwiftUI

final class LoginViewModel:ObservableObject{
    
    @AppStorage ("accessToken") private var accessToken:String?
    @Published var model: LoginResponseModel?
    @Published var navigateToHome : Bool = false
    
    func loginUser(body:[String:Any],completion:@escaping (Bool)->()){
        NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/users/login")!, method: .post, params: nil, headers: nil, body: body, bodyType: .urlEncoded)
         { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                    DispatchQueue.main.async{
                        self.model = json
                        if self.model?.status == 200{
                            self.navigateToHome = true
                            self.accessToken = json.data.accessToken
                        }else{
                            self.navigateToHome = false
                        }
                        print("this is json: \(json)")
                        completion(true)
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                    completion(false)
                }
            case .failure(let error):
                print("Failure: \(error)")
            }
        }
    }
}
