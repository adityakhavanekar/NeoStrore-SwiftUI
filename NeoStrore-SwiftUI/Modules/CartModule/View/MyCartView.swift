//
//  MyCartView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct MyCartView: View {
    
    @StateObject var myCartViewModel:MyCartViewModel = MyCartViewModel()
    
    var body: some View {
        VStack{
            if let myCart = myCartViewModel.myCartModel,let count = myCartViewModel.myCartModel?.count{
                List(0..<count+1){order in
                    if order == myCart.count{
                        HStack{
                            Spacer()
                            Button{
                                print("Order Placed")
                            }label: {
                                NeoButton(buttonText: "ORDER NOW", foregroundColor: .white, backgroundColor: .red)
                            }
                            Spacer()
                        }
                    }else{
                        MyCartListCell(image: myCart.data?[order].product.productImages ?? "MockFurniture", name: myCart.data?[order].product.name ?? "", category: myCart.data?[order].product.productCategory ?? "")
                    }
                }.listStyle(.plain)
            }
        }.onAppear(){
            myCartViewModel.getMyCartList { bool in
                print(bool)
            }
        }
    }
}

#Preview {
    MyCartView()
}
