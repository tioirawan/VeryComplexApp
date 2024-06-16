//
//  TLButton.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 14/06/24.
//

import SwiftUI

struct TLButton: View {
    let text: String;
    let color: Color = .blue
    let action: () -> Void
    
    init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                
                Text(text)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 18)
    }
}

#Preview {
    TLButton( "Login") {
        
    }
}
