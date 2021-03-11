//
//  Effect.swift
//  CardAnimation3D
//
//  Created by shashank on 11/03/21.
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
        projection.m34 = 0.0015
        projection = CATransform3DRotate(projection, angleToUse, 0, 1, 0)
        projection = CATransform3DTranslate(projection, -size.width / 2, -size.height / 2, 0)
        
        let projection2 = ProjectionTransform(CGAffineTransform(translationX: size.width / 2, y: size.height / 2))
         
        return ProjectionTransform(projection).concatenating(projection2)
    }
    
    
}
