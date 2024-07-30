//
//  ProductDetailView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/1/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var currentPhoto:String
    @State var isShowingBuyView:Bool
    
    var body: some View {
        ZStack{
            Color(.secondarySystemBackground).ignoresSafeArea()
            GeometryReader{geometry in
                ScrollView{
                    VStack(alignment:.leading){
                        VStack(alignment: .leading){
                            Text("6 Seater Family Dining table")
                                .font(.headline)
                            Text("Category - Tables")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Future Furniture Center")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(width: geometry.size.width,alignment: .leading)
                        .background(Color.white)
                        
                        VStack(alignment:.leading){
                            Text("Rs 27,520")
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                                .font(.system(size: 20))
                            Image(currentPhoto)
                                .resizable()
                                .frame(height: 200)
                            
                            HStack{
                                Image("MockFurniture")
                                    .resizable()
                                    .frame(width: geometry.size.width/3.5,height: 100)
                                    .onTapGesture {
                                        currentPhoto = "MockFurniture"
                                    }
                                Image("email")
                                    .resizable()
                                    .frame(width: geometry.size.width/3.5,height: 100)
                                    .onTapGesture {
                                        currentPhoto = "email"
                                    }
                                Image("padlock")
                                    .resizable()
                                    .frame(width: geometry.size.width/3.5,height: 100)
                                    .onTapGesture {
                                        currentPhoto = "padlock"
                                    }
                            }
                            
                            VStack{
                                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")
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
        }
    }
}

#Preview {
    ProductDetailView(currentPhoto: "MockFurniture", isShowingBuyView: false)
}
