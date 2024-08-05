//
//  MyCartListCell.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyCartListCell: View {
    
    @State var selectedQuantity: Int = 1
    @State var image:String
    @State var name:String
    @State var category:String
    
    var body: some View {
        HStack{
            WebImage(url: URL(string:image))
                .resizable()
                .frame(width: 100,height: 100)
                .padding(.trailing)
            VStack(alignment:.leading){
                Text(name)
                    .font(.system(size: 17))
                Text("(\(category))")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                HStack{
                    Menu {
                        Button("1") {
                            selectedQuantity = 1
                        }
                        Button("2") {
                            selectedQuantity = 2
                        }
                        Button("3") {
                            selectedQuantity = 3
                        }
                        Button("4") {
                            selectedQuantity = 4
                        }
                        Button("5") {
                            selectedQuantity = 5
                        }
                        Button("6") {
                            selectedQuantity = 6
                        }
                        Button("7") {
                            selectedQuantity = 7
                        }
                        Button("8") {
                            selectedQuantity = 8
                        }
                        Button("9") {
                            selectedQuantity = 9
                        }
                        Button("10") {
                            selectedQuantity = 10
                        }
                    } label: {
                            HStack {
                                Text("\(selectedQuantity)")
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                            }
                        }
                }
                .padding(7)
                .background(.secondary)
            }
        }
    }
}

#Preview {
    MyCartListCell(image: "", name: "", category: "")
}
