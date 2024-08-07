//
//  MyCartView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct MyCartView: View {
    
    @StateObject var myCartViewModel:MyCartViewModel = MyCartViewModel()
    @State var totalPrice:String
    @State var isLoading:Bool = false
    
    var body: some View {
        ZStack {
            if isLoading{
                ProgressView()
            }else{
                VStack{
                    if let myCart = myCartViewModel.myCartModel,let count = myCartViewModel.myCartModel?.count{
                        
                        List(0..<count+2){order in
                            if order == count{
                                TotalCell(totalPrice: $totalPrice)
                            }else if(order > count){
                                HStack{
                                    Spacer()
                                    NavigationLink(destination: AddressView(totalPrice: "\(myCartViewModel.myCartModel?.total ?? 0)")) {
                                        OrderNowCell()
                                    }
                                    Spacer()
                                }
                                
                            }
                            else{
                                MyCartListCell(selectedQuantity: myCartViewModel.myCartModel?.data?[order].quantity ?? 0, image: myCart.data?[order].product.productImages ?? "MockFurniture", name: myCart.data?[order].product.name ?? "", category: myCart.data?[order].product.productCategory ?? ""){ quantity in
                                    print(quantity)
                                    if let productId = myCartViewModel.myCartModel?.data?[order].productID{
                                        myCartViewModel.updateCartProduct(productId: productId, quantity: quantity) { bool in
                                            switch bool{
                                            case true:
                                                myCartViewModel.getMyCartList { bool in
                                                    if let total = myCartViewModel.myCartModel?.total{
                                                        totalPrice = "\(total)"
                                                    }
                                                }
                                            case false:
                                                print("Item Failed to update")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .listStyle(.sidebar)
                    }else if myCartViewModel.myCartModel?.data?.count == 0{
                        Text("NO ITEMS IN THE CART. START SHOPPING")
                    }
                }
            }
        }.onAppear(){
            isLoading = true
            myCartViewModel.getMyCartList { bool in
                if let total = myCartViewModel.myCartModel?.total{
                    totalPrice = "\(total)"
                    
                }
                isLoading = false
                
            }
        }
    }
}

#Preview {
    MyCartView(totalPrice: "")
}
