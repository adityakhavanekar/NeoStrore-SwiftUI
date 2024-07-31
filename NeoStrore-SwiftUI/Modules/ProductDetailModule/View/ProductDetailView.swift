//
//  ProductDetailView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/1/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    @State var currentPhoto:String = ""
    @State var isShowingBuyView:Bool
    @StateObject var productDetailViewModel:ProductDetailViewModel = ProductDetailViewModel()
    
    var productId: Int = 1
    
    var body: some View {
        ZStack{
            Color(.secondarySystemBackground).ignoresSafeArea()
            GeometryReader{geometry in
                ScrollView{
                    VStack(alignment:.leading){
                        VStack(alignment: .leading){
                            Text(productDetailViewModel.product?.data.name ?? "")
                                .font(.headline)
                            Text(productDetailViewModel.product?.data.producer ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(productDetailViewModel.product?.data.description ?? "")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(width: geometry.size.width,alignment: .leading)
                        .background(Color.white)
                        
                        VStack(alignment:.leading){
                            Text("Rs \(productDetailViewModel.product?.data.cost ?? 0)")
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                                .font(.system(size: 20))
                            WebImage(url: URL(string:currentPhoto))
                                .resizable()
                                .frame(height: 200)
                            
                            ScrollView(.horizontal){
                                HStack{
                                    if let images = productDetailViewModel.product?.data.productImages{
                                        ForEach(images){ image in
                                            WebImage(url: URL(string: image.image))
                                                .resizable()
                                                .frame(width: geometry.size.width/3.5,height: 100)
                                                .onTapGesture {
                                                    currentPhoto = image.image
                                                }
                                        }
                                    }
                                }
                            }
                            
//                            HStack{
//                                WebImage(url: URL(string: productDetailViewModel.product?.data.productImages[0].image ?? ""))
//                                    .resizable()
//                                    .frame(width: geometry.size.width/3.5,height: 100)
//                                    .onTapGesture {
//                                        currentPhoto = "MockFurniture"
//                                    }
//                                WebImage(url: URL(string: productDetailViewModel.product?.data.productImages[1].image ?? ""))
//                                    .resizable()
//                                    .frame(width: geometry.size.width/3.5,height: 100)
//                                    .onTapGesture {
//                                        currentPhoto = "email"
//                                    }
//                                WebImage(url: URL(string: productDetailViewModel.product?.data.productImages[1].image ?? ""))
//                                    .resizable()
//                                    .frame(width: geometry.size.width/3.5,height: 100)
//                                    .onTapGesture {
//                                        currentPhoto = "padlock"
//                                    }
//                            }
                            
                            VStack{
                                Text(productDetailViewModel.product?.data.description ?? "")
                            }
                        }
                        .padding()
                        .frame(width: geometry.size.width,alignment: .leading)
                        .background(Color.white)
                        
                        HStack{
                            Button{
                                isShowingBuyView = true
                            }label: {
                                Text("Buy Now")
                                    .foregroundColor(.white)
                                    .fontWeight(.black)
                                    .frame(width: geometry.size.width/2.5,height: 50)
                                    .background(Color.red)
                                    .font(.title2)
                            }
                            NavigationLink(destination: AddressView()) {
                                Text("Rate")
                                    .foregroundColor(.white)
                                    .fontWeight(.black)
                                    .frame(width: geometry.size.width/2.5,height: 50)
                                    .background(Color.red)
                                    .font(.title2)
                                    .padding(.leading)
                            }
                        }
                        .frame(width: geometry.size.width)
                        .padding(.top)
                        .padding(.bottom)
                        .background(Color.white)
                        
                    }
                }
                .blur(radius: isShowingBuyView ? 30 : 0)
                
            }.navigationBarBackButtonHidden(isShowingBuyView ? true : false)
            if isShowingBuyView {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isShowingBuyView = false
                    }
                ProductBuyView(isShowingBuyView: $isShowingBuyView)
                    
            }
        }.onAppear(){
            productDetailViewModel.getProductDetail(productId: productId) { bool in
                switch bool{
                case true:
                    if let photo = productDetailViewModel.product?.data.productImages[0].image{
                        currentPhoto = photo
                    }
                case false:
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(currentPhoto: "MockFurniture", isShowingBuyView: false)
}
