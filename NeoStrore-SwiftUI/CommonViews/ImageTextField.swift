//
//  ImageTextField.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/28/24.
//

import SwiftUI

struct ImageTextField: View {
    
    @Binding var content: String
    var imageName:String
    var isPassowrd:Bool
    
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.leading,5)
            TextField("", text: $content)
                .foregroundColor(.white)
        }
        .textContentType(isPassowrd ? .password : .none)
        .frame(height: 50)
        .border(.white,width: 2)
        .padding(.leading,30)
        .padding(.trailing,30)
    }
}

#Preview {
    ImageTextField(content: .constant("Hello"), imageName: "", isPassowrd: false)
}
