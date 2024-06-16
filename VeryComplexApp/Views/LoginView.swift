//
//  LoginView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Login",
                subtitle: "Welcome to the best Todo App Ever created!",
                color: .blue
            )
            .padding(.bottom, -100 + 28) // compesate the offset
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Passwword", text: $viewModel.password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                TLButton("Login") {
                    viewModel.login()
                }
            }
            .padding()
            
            VStack {
                Text("New around here?")
                NavigationLink("Create an Account",
                               destination: RegisterView()
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
