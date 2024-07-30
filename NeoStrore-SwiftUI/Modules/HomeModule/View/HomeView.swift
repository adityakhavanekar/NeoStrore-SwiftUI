//
//  HomeView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/29/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var categories = ["Tables","Chairs","Sofas","Cupboards"]
    
    var body: some View {
        ZStack{
            
            Color(.white).ignoresSafeArea()
            
            GeometryReader{ outerGometry in
                VStack{
                    GeometryReader{ geometry in
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(0..<5){_ in
                                    HomeCarasolCellView()
                                        .frame(width: geometry.size.width,
                                               height: geometry.size.height)
                                        .onTapGesture {
                                            print("Printed")
                                        }
                                }
                            }
                        }
                    }
                    .frame(height: outerGometry.size.height * 0.4)
                    GeometryReader{geometry in
                        LazyVGrid(columns: [
                            GridItem(.fixed(geometry.size.width/2.1)),
                            GridItem(.fixed(geometry.size.width/2.1))]){
                                ForEach(0..<categories.count){category in
                                    NavigationLink(destination: ProductListingView(productCategoryId: category+1)){
                                        HomeFurnitureCellView(category: "\(categories[category])")
                                            .frame(width: geometry.size.width/2.1,height: geometry.size.height/2)
                                            .background(Color.red)
                                    }
                                }
                            }
                    }.padding(10)
                }
                .frame(width: outerGometry.size.width)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("NeoSTORE")
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .font(.title2)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
