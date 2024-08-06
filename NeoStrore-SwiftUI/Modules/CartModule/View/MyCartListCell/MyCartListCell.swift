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
    var updateQuantity: (Int) -> Void
    
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
                            updateQuantity(selectedQuantity)
                        }
                        Button("2") {
                            selectedQuantity = 2
                            updateQuantity(selectedQuantity)
                        }
                        Button("3") {
                            selectedQuantity = 3
                            updateQuantity(selectedQuantity)
                        }
                        Button("4") {
                            selectedQuantity = 4
                            updateQuantity(selectedQuantity)
                        }
                        Button("5") {
                            selectedQuantity = 5
                            updateQuantity(selectedQuantity)
                        }
                        Button("6") {
                            selectedQuantity = 6
                            updateQuantity(selectedQuantity)
                        }
                        Button("7") {
                            selectedQuantity = 7
                            updateQuantity(selectedQuantity)
                        }
                        Button("8") {
                            selectedQuantity = 8
                            updateQuantity(selectedQuantity)
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
    MyCartListCell(selectedQuantity: 1, image: "", name: "", category: ""){_ in 
        
    }
}
