//
//  AddressListCell.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/7/24.
//

import SwiftUI

struct AddressListCell: View {
    @Binding var isSelected:Bool
    @Binding var name:String
    @Binding var address:String
    
    var body: some View {
        HStack{
            Image(systemName: isSelected ? "circle.circle.fill" : "circle")
                .resizable()
                .frame(width: 20,height: 20)
                .padding(.trailing)
            VStack{
                Text(name).font(.headline)
                Text(address).font(.subheadline)
            }
        }.padding()
    }
}

#Preview {
    AddressListCell(isSelected: .constant(true), name: .constant("Hello World"), address: .constant("Hello"))
}

//"Neosoft Technology, 4th Floor, The Ruby, 29. Senapati Bapat Marg, Dadar West Mumbai 400-028, India"
