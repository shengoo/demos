//
//  DrawExamples.swift
//  DrawDemo
//
//  Created by Qing Sheng on 15/7/2.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class DrawExamples: UIView {

    
    override func drawRect(rect: CGRect) {
        //context is the object used for drawing
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3.0)
        CGContextSetStrokeColorWithColor(context, UIColor.purpleColor().CGColor)
        
        
//        //straight line
//        CGContextMoveToPoint(context, 50, 60)
//        CGContextAddLineToPoint(context, 250, 320)
        
        
//        CGContextMoveToPoint(context, 50, 50)
//        CGContextAddLineToPoint(context, 90, 130)
//        CGContextAddLineToPoint(context, 180, 100)
//        CGContextAddLineToPoint(context, 90, 60)
//        CGContextAddLineToPoint(context, 50, 50)
        
        
        
        //rectangle
        let rectangle = CGRectMake(50, 50, 200, 400)
        CGContextAddRect(context, rectangle)
        
        
        //actually draw the path
        CGContextStrokePath(context)
        
    
    }


}
