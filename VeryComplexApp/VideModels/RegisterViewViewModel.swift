//
//  RegisterViewViewModel.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
                !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all the fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please use a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter password with atleast 6 chars"
            return false
        }
        
        return true
    }
    
}
