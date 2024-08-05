//
//  ProductBuyView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductBuyView: View {
    
    var productId:String
    @State var quantity:String = ""
    @State var isShowingError:Bool = false
    @State var image:String
    @Binding var isShowingBuyView:Bool
    @StateObject var productBuyViewModel:ProductBuyViewModel = ProductBuyViewModel()
    
    var body: some View {
        VStack(alignment:.center){
            Text("6 Seater Dining Table")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            WebImage(url: URL(string: image))
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
            Button{
                if let quantity = Int(quantity) , let productId = Int(productId){
                    productBuyViewModel.buyProduct(productId: productId, quantity: Int(quantity)) { bool in
                        switch bool{
                        case true:
                            isShowingBuyView = false
                        case false:
                            print("")
                        }
                    }
                }else{
                    isShowingError = true
                }
            }label: {
                NeoButton(buttonText: "SUBMIT", foregroundColor: .white, backgroundColor: .red)
                    .padding(.bottom,20)
            }
        }
        .frame(width: 350)
        .background(Color.white)
        .cornerRadius(10)
        .alert(isPresented: $isShowingError, content: {
            Alert(title: Text("Error"), message: Text("Enter Quantity"), dismissButton: .default(Text("Try Again"), action: {}))
        })
    }
}

#Preview {
    ProductBuyView(productId: "1", image: "MockFurniture", isShowingBuyView: .constant(false))
}
