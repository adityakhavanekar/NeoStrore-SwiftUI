//
//  RegisterView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/28/24.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var confirmPassword:String = ""
    @State var phoneNumber:String = ""
    @State var isMale:Bool = false
    @State var isFemale:Bool = false
    @State var isTCAccepted = false
    
    @State var isShowingAlert:Bool = false
    
    @StateObject var registerViewModel:RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        
        ZStack{
            Color(.systemRed).ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("NeoSTORE")
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding()
                    
                    ImageTextField(content: $firstName, imageName: "profile", isPassowrd: false)
                        .padding(.bottom)
                    ImageTextField(content: $lastName, imageName: "profile", isPassowrd: false)
                        .padding(.bottom)
                    ImageTextField(content: $email, imageName: "profile", isPassowrd: false)
                        .padding(.bottom)
                    ImageTextField(content: $password, imageName: "profile", isPassowrd: false)
                        .padding(.bottom)
                    ImageTextField(content: $confirmPassword, imageName: "profile", isPassowrd: false)
                        .padding(.bottom)
                    
                    HStack {
                        Text("Gender: ")
                            .fontWeight(.bold)
                            .padding(.trailing)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            self.isMale = true
                            self.isFemale = false
                        }) {
                            HStack {
                                RadioButton(selectedImage: self.isMale ? "largecircle.fill.circle" : "circle", buttonText: "Male")
                            }
                        }
                        .padding(.trailing)
                        
                        Button(action: {
                            self.isMale = false
                            self.isFemale = true
                        }) {
                            RadioButton(selectedImage: self.isFemale ? "largecircle.fill.circle" : "circle", buttonText: "Female")
                        }
                    }.padding(.bottom)
                    
                    ImageTextField(content: $phoneNumber, imageName: "smartphone", isPassowrd: false)
                        .padding(.bottom)
                    
                    HStack{
                        Button{
                            isTCAccepted.toggle()
                        }label: {
                            Image(systemName: self.isTCAccepted ? "square.fill" : "square")
                                .foregroundColor(.white)
                            Text("Accept Terms and Conditions")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                        }
                    }.padding(.bottom)
                    Button{
                        let body = [
                            "first_name":firstName,
                            "last_name":lastName,
                            "email":email,
                            "password":password,
                            "confirm_password":confirmPassword,
                            "gender":isMale ? "M" : "F",
                            "phone_no":phoneNumber
                        ]
                        registerViewModel.registerUser(body: body) { boolData in
                            isShowingAlert = true
                        }
                    }label: {
                        NeoButton(buttonText: "REGISTER",foregroundColor: .red,backgroundColor: .white).padding(.bottom)
                    }
                }
            }
            
        }
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: registerViewModel.model?.status == 200 ? Text("Successful") : Text("Error"),message: Text(registerViewModel.model?.message ?? ""),primaryButton: .default(Text("Login"), action: {
                presentationMode.wrappedValue.dismiss()
            }),secondaryButton: .cancel())
        })
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Register")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    RegisterView(firstName: "FirstName", lastName: "LastName", email: "Adity@Fmail.com", password: "ABCD", confirmPassword: "GHGK", phoneNumber: "90982")
}
