//
//  CardGame.swift
//  CardAnimation3D
//
//  Created by shashank on 10/03/21.
//

import SwiftUI

var screen = UIScreen.main.bounds

struct CardGame: View {
    @StateObject var viewModel = CardGameViewModel()
    let gridItem = Array(repeating: GridItem(.adaptive(minimum: screen.width / 3, maximum: screen.width / 3)), count: 3)
    var body: some View {
        VStack {
            Text("Card Game")
            GeometryReader { proxy -> AnyView in
                let heightOfCard = (proxy.size.height - 100) / 5
                return AnyView (
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            LazyVGrid(columns: gridItem, alignment: .center) {
                                ForEach(0..<viewModel.models.count, id: \.self) { index in
                                    GameCard(model: viewModel.models[index])
                                        .frame(height: heightOfCard)
                                        .environmentObject(viewModel)
                                }
                            }
                        }
                        .padding(.vertical)
                    })
                )
            }
            
        }
        .padding()
       
    }
}


struct CardGame_Previews: PreviewProvider {
    static var previews: some View {
        CardGame()
    }
}
