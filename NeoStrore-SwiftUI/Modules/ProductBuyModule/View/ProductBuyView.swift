//
//  ProductBuyView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct ProductBuyView: View {
    
    @State var quantity:String = ""
    @Binding var isShowingBuyView:Bool
    
    var body: some View {
        VStack(alignment:.center){
            Text("6 Seater Dining Table")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            Image("MockFurniture")
                .resizable()
                .frame(width: 250,height: 250)
                .padding(.bottom,20)
            Text("Enter Qty:")
                .font(.title2)
            TextField("Quantity", text: $quantity)
                .font(.title2)
                .frame(width: 100,height: 30)
                .padding(10)
                .border(.black)
                .padding(.bottom,20)
            Button{}label: {
                NeoButton(buttonText: "SUBMIT", foregroundColor: .white, backgroundColor: .red)
                    .padding(.bottom,20)
            }
        }
        .frame(width: 350)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    ProductBuyView(isShowingBuyView: .constant(false))
}
