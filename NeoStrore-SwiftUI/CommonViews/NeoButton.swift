//
//  NeoButton.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/28/24.
//

import SwiftUI

struct NeoButton: View {
    var buttonText:String
    var foregroundColor:Color
    var backgroundColor:Color
    var body: some View {
        Text(buttonText)
            .frame(width: 300, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

#Preview {
    NeoButton(buttonText: "LOGIN",foregroundColor: .red,backgroundColor: .white)
}
