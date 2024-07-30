//
//  ProductListingView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/30/24.
//

import SwiftUI

struct ProductListingView: View {
    
    var productCategoryId:Int = 1
    
    @StateObject var productListingViewModel:ProductListingViewModel = ProductListingViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            List(productListingViewModel.product){item in
                NavigationLink(destination: ProductDetailView(currentPhoto: "MockFurniture", isShowingBuyView: false)) {
                    ProductListCellView()
                        .frame(height: geometry.size.height/8)
                }
            }.listStyle(.plain)
        }.onAppear(){
            productListingViewModel.getProductListing(productCategoryId: productCategoryId) { bool in
                print(bool)
            }
        }
    }
}

#Preview {
    ProductListingView(productCategoryId: 1)
}
