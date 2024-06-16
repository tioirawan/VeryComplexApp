//
//  TodoListItemView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .bold()
                Text(
                    "\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))"
                )
                .font(.footnote)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleDown(item.id)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":  "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(
        item: TodoListItem(
            id: "test",
            title: "Something",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true
        )
    )
}
