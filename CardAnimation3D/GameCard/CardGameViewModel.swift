//
//  CardGameViewModel.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
//

import SwiftUI

class CardGameViewModel: ObservableObject {
    @Published var disableTap: Bool = false
    var colors: [Color] = [.blue, .black, .green, .orange, .pink, .purple, .yellow]
    var models = [CardModel]()
    var selectedCards = [CardModel]()
    init() {
        for index in 0..<14 {
            models.append(CardModel(color: colors[index / 2]))
        }
      models.shuffle()
    }
    
    func selectedCard(card: CardModel) {
        guard  self.disableTap != true, !card.flip else {
            return
        }
        if selectedCards.count == 2 {
            selectedCards[0].flip = false
            selectedCards[1].flip = false
            selectedCards.removeAll()
        }
        card.flip = true
        selectedCards.append(card)
        if selectedCards.count == 2 {
            if selectedCards[0].color == selectedCards[1].color {
                self.disableTap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.disableTap = false
                        self.selectedCards[0].isRemoved = true
                        self.selectedCards[1].isRemoved = true
                        self.selectedCards.removeAll()
                    }
                }
            }
        }
    }
}
