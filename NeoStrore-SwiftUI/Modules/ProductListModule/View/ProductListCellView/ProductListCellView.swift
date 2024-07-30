//
//  ProductListCellView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/30/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductListCellView: View {
    
    @State var thumbnail:String = ""
    @State var name:String = ""
    @State var category:String = ""
    @State var price:String = ""
    
    var body: some View {
        HStack{
            WebImage(url: URL(string: thumbnail))
//            Image("menu")
                .resizable()
                .frame(width: 100,height: 80)
            VStack(alignment:.leading){
                Text(name)
                    .font(.subheadline)
                    .lineLimit(2)
                Text(category)
                    .foregroundColor(.secondary)
                    .font(.caption)
                Text("Rs \(price)").font(.title3).foregroundColor(.red)
            }.padding(.leading)
        }
    }
}

#Preview {
    ProductListCellView()
}
