//
//  GameCard.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
//

import SwiftUI

class CardModel: ObservableObject, Equatable {
    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        return lhs.id == rhs.id
    }
    @Published var isFlipped: Bool = false
    @Published var flip: Bool = false
    @Published var isRemoved: Bool = false
    var color: Color
    var id = UUID()
    init(color: Color) {
        self.color = color
    }
}

struct GameCard: View {
    @ObservedObject var model: CardModel
    @EnvironmentObject var parent: CardGameViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .opacity(model.isFlipped ? 0: 1)
            RoundedRectangle(cornerRadius: 10)
                .fill(model.color)
                .opacity(model.isFlipped ? 1: 0)
        }
        .scaleEffect(model.isRemoved ? 0: 1)
        .opacity(model.isRemoved ? 0: 1)
        .modifier(Effect(angle: model.flip ? 180: 0, isFlipped: $model.isFlipped))
        .onTapGesture {
            withAnimation(Animation.spring(response: 1, dampingFraction: 1, blendDuration: 1).speed(1)) {
                if !model.isRemoved {
                    parent.selectedCard(card: model)
                }
            }
        }
           
    }
}
