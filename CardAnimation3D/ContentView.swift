//
//  ContentView.swift
//  CardAnimation3D
//
//  Created by shashank on 09/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var showCardAnimation: Bool = false
    @State  var showCardGame: Bool = false
    var body: some View {
        VStack {
            Button(action: {
                self.showCardAnimation = true
            }, label: {
                Text("Card Animation")
            })
            .sheet(isPresented: self.$showCardAnimation, content: {
                CardAnimation()
            })
            Button(action: {
               
                self.showCardGame = true
            }, label: {
                Text("Card Game")
            })
            .sheet(isPresented: self.$showCardGame, content: {
                CardGame()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

