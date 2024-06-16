//
//  NewItemView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct NewItemView : View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top)
            
            Form {
                TextField("Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                TLButton("Save") {
                    let success = viewModel.save()
                    
                    if success {
                        newItemPresented = false
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in fields and select due date newer than today")
                )
            }
        }
    }
}

#Preview {
    NewItemView(
        newItemPresented: Binding(
            get: {
                return true
            }, set: { _ in
                
            }
        )
    )
}
