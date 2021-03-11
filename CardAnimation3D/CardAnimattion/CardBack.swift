//
//  CardBack.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
//

import SwiftUI

struct CardBack: View {
    var cvv: String
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(LinearGradient(gradient: Gradient(colors: [Color("bg"), Color("forgroundColor")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 300, height: 200)
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Rectangle()
                        .frame(height: 40)
                        .padding(.top)
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 40)
                        .overlay(
                            Text(cvv)
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing, 5)
                            , alignment: .trailing
                        )
                        .padding(.horizontal)
                    Spacer()
                    
                }
                
            )
    }
}
