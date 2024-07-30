//
//  AddressListView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/7/24.
//

import SwiftUI

struct AddressListView: View {
    
    @State private var addresses: [Address] = [
        Address(isSelected: false,
                name: "John Doe",
                address: "123 Main St, Springfield, USA"),
        Address(isSelected: false,
                name: "Jane Smith",
                address: "456 Elm St, Springfield, USA"),
        Address(isSelected: false,
                name: "Sam Johnson",
                address: "789 Oak St, Springfield, USA")
    ]
    
    var body: some View {
        VStack(alignment:.center){
            HStack {
                Text("SHIPPING ADDRESS")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            }
            List {
                ForEach(0..<$addresses.count) { index in
                    AddressListCell(isSelected: $addresses[index].isSelected, name: $addresses[index].name, address: $addresses[index].address)
                        .onTapGesture {
                            selectAddress(at: index)
                        }
                }
            }.listStyle(.plain)
            NeoButton(buttonText: "PLACE ORDER", foregroundColor: .white, backgroundColor: .red)
                .padding()
        }
    }
    
    private func selectAddress(at index: Int) {
            for i in addresses.indices {
                addresses[i].isSelected = (i == index)
            }
        }
}

#Preview {
    AddressListView()
}

struct Address: Identifiable {
    let id = UUID()
    var isSelected: Bool
    var name: String
    var address: String
}
