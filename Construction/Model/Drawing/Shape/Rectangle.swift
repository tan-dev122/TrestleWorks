//
//  Rectangle.swift
//  Construction
//
//  Created by Macmini on 11/3/17.
//  Copyright © 2017 LekshmySankar. All rights reserved.
//

import UIKit

class Rectangle: Shape {
    override func drawShape(context: CGContext, zoomScale: CGFloat) -> Bool {
        guard super.drawShape(context: context, zoomScale: zoomScale) else {
            return false
        }
        
        context.beginPath()
        context.setLineWidth(lineWidth * zoomScale)
        context.setLineCap(.round)
        context.setStrokeColor(self.color.cgColor)
        context.setLineDash(phase: 0, lengths: [])
        
        var startPoint = points[0]
        for point in self.points {
            if point == startPoint {
                continue
            }
            
            context.move(to: startPoint)
            context.addLine(to: point)
            startPoint = point
        }
        context.addLine(to: points[0])
        context.strokePath()
        return true
    }
    
    override func update(at index: Int, with point: CGPoint) {
        if index == -1 {
            return
        }
        
        let old = points[index]
        for i in 0..<points.count {
            if i == index {
                continue
            }
            
            if points[i].x == old.x {
                points[i].x = point.x
            }
            
            if points[i].y == old.y {
                points[i].y = point.y
            }
        }
        super.update(at: index, with: point)
    }
}
