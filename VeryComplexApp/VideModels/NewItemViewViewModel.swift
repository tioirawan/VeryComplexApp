//
//  NewItemViewViewModel.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    func save() -> Bool {
        guard canSafe else {
            showAlert = true
            return false
        }
        
        // get current id
        guard let uid = Auth.auth().currentUser?.uid else {
            return false
        }
        
        let db = Firestore.firestore()
        
        // create model
        let id = UUID().uuidString
        let newItem = TodoListItem(
            id: id,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // save model
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(id)
            .setData(newItem.asDictionary())
        
        return true
    }
    
    var canSafe: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        guard dueDate >= yesterday! else {
            return false
        }
        
        return true
    }
}
