//
//  RegisterViewModel.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/8/24.
//

import Foundation

final class RegisterViewModel:ObservableObject{
    
    @Published var model: RegisterResponseModel?
    
    func registerUser(body:[String:Any],completion:@escaping (Bool)->()){
        NetworkManager.shared.request(url: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/users/register")!, method: .post, params: nil, headers: nil, body: body, bodyType: .urlEncoded)
         { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(RegisterResponseModel.self, from: data)
                    self.model = json
                    print("this is json: \(json)")
                    completion(true)
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
