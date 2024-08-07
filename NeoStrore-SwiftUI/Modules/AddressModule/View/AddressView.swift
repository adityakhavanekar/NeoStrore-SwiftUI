//
//  AddressView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 7/3/24.
//

import SwiftUI

struct AddressView: View {
    
    @State var address:String = ""
    @State var city:String = ""
    @State var cityNew:String = ""
    @State var state:String = ""
    @State var zipCode:String = ""
    @State var country:String = ""
    @State var totalPrice:String = "9992"
    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea()
            ScrollView {
                VStack(alignment:.leading){
                    AddressTextField(header: "ADDRESS", placeholder: "ADDRESS", address: $address)
                        .padding(.bottom,10)
                    
                    AddressTextField(header: "CITY", placeholder: "City", textFieldHeight: 50, address: $city)
                        .padding(.bottom,10)
                    
                    VStack {
                        HStack(spacing:20){
                            AddressTextField(header: "CITY", placeholder: "CITY", textFieldHeight: 50, address: $cityNew)
                            AddressTextField(header: "STATE", placeholder: "STATE", textFieldHeight: 50, address: $state)
                        }.padding(.bottom,10)
                        HStack(spacing:20){
                            AddressTextField(header: "ZIP CODE", placeholder: "ZIP CODE", textFieldHeight: 50, address: $zipCode)
                            AddressTextField(header: "COUNTRY", placeholder: "COUNTRY", textFieldHeight: 50, address: $country)
                        }
                    }.padding(.bottom)
                    TotalCell(totalPrice: $totalPrice)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                    NavigationLink(destination: ProductListingView()) {
                        NeoButton(buttonText: "Place Order", foregroundColor: .white,backgroundColor: .red)
                            .padding()
                    }
                }
                .padding(.leading,20)
            .padding(.trailing,20)
            }
        }.navigationTitle(Text("Add New Address"))
    }
}

#Preview {
    AddressView()
}
