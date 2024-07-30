//
//  LoginView.swift
//  NeoStrore-SwiftUI
//
//  Created by Aditya Khavanekar on 6/28/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel:LoginViewModel = LoginViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State var userName:String = "testUs@gmail.com"
    @State var password:String = "HelloWorldNew@123"
    
    @State var isShowingError:Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(.systemRed).ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    Text("NeoSTORE")
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding()
                    
                    ImageTextField(content: $userName, imageName: "profile", isPassowrd: false)
                    
                    ImageTextField(content: $password, imageName: "padlock", isPassowrd: false)
                        .padding(.bottom,20)
                    Button{
                        callApi()
                    }label: {
                        NeoButton(buttonText: "LOGIN", foregroundColor: .red, backgroundColor: .white)
                    }
                    .padding(.bottom)
                    
                    NavigationLink(
                        destination: HomeView(),
                        isActive: $loginViewModel.navigateToHome,
                        label: {
                            EmptyView()
                        }
                    )
                    
                    Button{}label: {
                        Text("Forgot passowrd?")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()

                    NavigationLink(destination: RegisterView()) {
                        HStack{
                            Text("DONT HAVE AN ACCOUNT?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Image("add")
                                .resizable()
                                .frame(width: 30,height: 30)
                        }
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .padding(.bottom,25)
                    }
                }
            }
        }.alert(isPresented: $isShowingError, content: {
            Alert(title: Text("Error"), message: Text("Error"), dismissButton: .default(Text("Try Again"), action: {}))
        })
    }
    
    func callApi(){
        let body = ["email":userName,"password":password]
        loginViewModel.loginUser(body: body) { result in
            switch result{
            case true:
                if loginViewModel.model?.status == 200{
                    isShowingError = false
                }else{
                    isShowingError = true
                }
            case false:
                isShowingError = true
                print("error")
            }
        }
    }
}

#Preview {
    LoginView()
}
