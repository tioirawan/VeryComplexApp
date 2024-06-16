//
//  ProfileView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                    
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
