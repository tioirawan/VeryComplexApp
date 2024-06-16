//
//  VeryComplexAppApp.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//
import FirebaseCore
import SwiftUI

@main
struct VeryComplexAppApp: App {
    init() {
        FirebaseApp.configure();
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
