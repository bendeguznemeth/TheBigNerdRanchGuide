//
//  Line.swift
//  TouchTracker
//
//  Created by Németh Bendegúz on 2018. 12. 19..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import Foundation
import CoreGraphics

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
    
    var lineThickness: CGFloat = 10
    
    var velocity: CGPoint? {
        didSet {
            if let velocity = velocity {
                
                if let oldValue = oldValue {
                    
                    if abs(oldValue.x) > abs(velocity.x) {
                        self.velocity?.x = oldValue.x
                        return
                    }
                    
                    if abs(oldValue.y) > abs(velocity.y) {
                        self.velocity?.y = oldValue.y
                        return
                    }
                }
                
                lineThickness = 100 / ((abs(velocity.x) + abs(velocity.y)) / 80)
            }
        }
    }
    
    init(begin: CGPoint, end: CGPoint) {
        self.begin = begin
        self.end = end
    }
}
