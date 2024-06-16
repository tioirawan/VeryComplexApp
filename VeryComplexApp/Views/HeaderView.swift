//
//  HeaderView.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(.degrees(5))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
                .padding(.top, 100)
        }.frame(
            width: UIScreen.main.bounds.width * 3,
            height: 250).offset(y: -100)
    }
}

#Preview {
    HeaderView(
        title: "Login",
        subtitle: "Welcome to the best Todo App Ever created!",
        color: .blue
    )
}
