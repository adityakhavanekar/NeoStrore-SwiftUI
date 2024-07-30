//
//  AddressTextFields.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/7/24.
//

import SwiftUI

struct AddressTextField: View {
    
    var header:String = ""
    var placeholder:String = ""
    var textFieldHeight:CGFloat = 150
    @Binding var address:String
    
    var body: some View {
        VStack(alignment:.leading){
            Text(header)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
            TextField(placeholder, text: $address)
                .padding()
                .frame(height: textFieldHeight,alignment: .top)
                .background(Color.white)
                .cornerRadius(15)
        }
    }
}

#Preview {
    AddressTextField(address: .constant("Address"))
}
