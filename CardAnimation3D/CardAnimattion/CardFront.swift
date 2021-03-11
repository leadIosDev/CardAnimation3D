//
//  CardFront.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
//

import SwiftUI

struct CardFront: View {
    var cardNumber: String
    var name: String
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(LinearGradient(gradient: Gradient(colors: [Color("bg"), Color("forgroundColor")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 300, height: 200)
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Spacer()
                        Text("Credit Card")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                        Text(cardNumber)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    
                   
                        Text("Cardholder: \(name)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    
                   
                }
                .padding()
            )
    }
}
