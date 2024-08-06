//
//  TotalCell.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 8/6/24.
//

import SwiftUI

struct TotalCell: View {
    
    @Binding var totalPrice:String
    
    var body: some View {
        HStack{
            Text("TOTAL: ")
                .font(.headline)
                .padding(.leading,40)
            Spacer()
            Text("Rs. \(totalPrice)")
                .font(.headline)
                .foregroundStyle(.red)
                .padding(.trailing,40)
        }
    }
}

#Preview {
    TotalCell(totalPrice: .constant("999"))
}
