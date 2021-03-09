//
//  ContentView.swift
//  CardAnimation3D
//
//  Created by shashank on 09/03/21.
//

import SwiftUI

struct Effect: GeometryEffect {
    var angle: Double
    var animatableData: Double {
        get {
            return angle
        }
        set {
            self.angle = newValue
        }
    }
    @Binding var isFlipped: Bool
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.isFlipped = angle >= 90 && angle < 270
        }
        
        let angleToUse = CGFloat(Angle(degrees: isFlipped ? -180 + angle: angle).radians)
        var projection = CATransform3DIdentity
        projection.m34 = 0.001
        projection = CATransform3DRotate(projection, angleToUse, 0, 1, 0)
        projection = CATransform3DTranslate(projection, -size.width / 2, -size.height / 2, 0)
        
        let projection2 = ProjectionTransform(CGAffineTransform(translationX: size.width / 2, y: size.height / 2))
         
        return ProjectionTransform(projection).concatenating(projection2)
    }
    
    
}

struct ContentView: View {
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
            withAnimation {
                self.flip.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

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
