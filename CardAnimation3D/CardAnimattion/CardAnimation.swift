//
//  CardAnimation.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
//

import SwiftUI

struct CardAnimation: View {
    @State var isFlipped: Bool = false
    @State var flip: Bool = false
    var body: some View {
        ZStack {
            CardFront(cardNumber: "1234 5678 9012 3451", name: "XXXXXX")
                .opacity(isFlipped ? 0: 1)
            CardBack(cvv: "123")
                .opacity(isFlipped ? 1: 0)
        }
        .modifier(Effect(angle: flip ? 180: 0, isFlipped: $isFlipped))
        .onTapGesture {
            withAnimation(Animation.spring(response: 1, dampingFraction: 1, blendDuration: 1).speed(0.8)) {
                self.flip.toggle()
            }
        }
    }
}

struct CardAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CardAnimation()
    }
}
