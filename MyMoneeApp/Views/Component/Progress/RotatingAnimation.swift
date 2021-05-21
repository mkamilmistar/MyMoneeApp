//
//  RotatingAnimation.swift
//  MyMoneeApp
//
//  Created by MacBook on 21/05/21.
//

import Foundation
import UIKit

class RotationAnimation: CABasicAnimation {
    
    enum Direction: String {
        case coordinateX, coordinateY, coordinateZ
    }
    
    override init() {
        super.init()
    }
    
    public init(
        direction: Direction,
        fromValue: CGFloat,
        toValue: CGFloat,
        duration: Double,
        repeatCount: Float
    ) {
        
        super.init()
        
        self.keyPath = "transform.rotation.\(direction.rawValue)"
        
        self.fromValue = fromValue
        self.toValue = toValue
        
        self.duration = duration
        
        self.repeatCount = repeatCount
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
