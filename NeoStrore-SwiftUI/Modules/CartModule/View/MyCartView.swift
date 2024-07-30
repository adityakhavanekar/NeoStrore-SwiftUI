//
//  MyCartView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct MyCartView: View {
    var body: some View {
        VStack{
            List(0..<20){order in
                if order == 19{
                    HStack{
                        Spacer()
                        NeoButton(buttonText: "ORDER NOW", foregroundColor: .white, backgroundColor: .red)
                        Spacer()
                    }
                }else{
                    MyCartListCell()
                }
            }.listStyle(.plain)
        }
    }
}

#Preview {
    MyCartView()
}
