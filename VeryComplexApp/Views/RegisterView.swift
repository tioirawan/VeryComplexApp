//
//  RegisterView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Jointhe best Todo App Ever created!",
                color: .orange
            )
            .padding(.bottom, -100 + 28) // compesate the offset
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Passwword", text: $viewModel.password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                TLButton("Register") {
                    viewModel.register()
                }
            }
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
