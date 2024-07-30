//
//  ProductListCellView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/30/24.
//

import SwiftUI

struct ProductListCellView: View {
    var body: some View {
        HStack{
            Image("menu")
                .resizable()
                .frame(width: 100,height: 80)
            VStack(alignment:.leading){
                Text("Table for two at lowest Price")
                    .font(.subheadline)
                    .lineLimit(2)
                Text("Arron Tables")
                    .foregroundColor(.secondary)
                    .font(.caption)
                Text("Rs 27,520").font(.title3).foregroundColor(.red)
            }.padding(.leading)
        }
    }
}

#Preview {
    ProductListCellView()
}
