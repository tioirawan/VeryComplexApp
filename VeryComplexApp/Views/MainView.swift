//
//  ContentView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TodoListView()
        } else {
            NavigationView {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
