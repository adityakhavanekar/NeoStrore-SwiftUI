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
                    Menu{
                        Button {
                            selectedQuantity+=1
                        } label: {
                            Text("")
                        }
                    }label: {
                        Text("\(selectedQuantity)").foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    Image(systemName: "chevron.down").foregroundColor(.white)
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
