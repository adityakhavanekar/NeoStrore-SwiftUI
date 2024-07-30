//
//  RadioButton.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/28/24.
//

import SwiftUI

struct RadioButton: View {
    
    var selectedImage:String
    var buttonText:String
    
    var body: some View {
        HStack {
            Image(systemName: selectedImage)
                .foregroundColor(.white)
            Text(buttonText)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    RadioButton(selectedImage: "argecircle.fill.circle", buttonText: "Male")
}
