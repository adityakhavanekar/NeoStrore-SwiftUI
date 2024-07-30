//
//  HomeFurnitureCellView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/30/24.
//

import SwiftUI

struct HomeFurnitureCellView: View {
    var category: String = "Table"
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Image("MockFurniture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    .padding()
                Text("\(category)")
                    .minimumScaleFactor(0.1)
                    .frame(height: 30)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
//                    .padding()
            }
            .frame(width: geometry.size.width)
//            .padding(.top)
//            .padding(.bottom)
//            .background(Color.red)
        }
    }
}

#Preview {
    HomeFurnitureCellView()
}
