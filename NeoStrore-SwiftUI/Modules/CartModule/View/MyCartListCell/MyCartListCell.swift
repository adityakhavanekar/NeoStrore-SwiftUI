//
//  MyCartListCell.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct MyCartListCell: View {
    
    @State var selectedQuantity: String = "1"
    
    var body: some View {
        HStack{
            Image("MockFurniture")
                .resizable()
                .frame(width: 100,height: 100)
                .padding(.trailing)
            VStack(alignment:.leading){
                Text("6 Seater Sofa Family Dining")
                    .font(.system(size: 17))
                Text("(Table)")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                HStack{
                    Menu{}label: {
                        Text(selectedQuantity).foregroundColor(.white)
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
    MyCartListCell()
}
