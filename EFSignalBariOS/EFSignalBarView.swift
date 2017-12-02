//
//  RSSIIndicatorView.swift
//  EFSignalBariOS
//
//  Created by Erhies Fekarurhobo on 2017-09-13.
//  Copyright © 2017 Ratatat. All rights reserved.
//

import UIKit

@IBDesignable
public class EFSignalBarView: UIView {

    var firstSignalBarColor:UIColor = UIColor()
    var secondSignalBarColor:UIColor = UIColor()
    var thirdSignalBarColor:UIColor = UIColor()
    var fourthSignalBarColor:UIColor = UIColor()
    
    
    @IBInspectable public var signal: SignalStrength = .Unknown{
        didSet {
            setNeedsDisplay()
        }
    }
    public enum SignalStrength: String {
        
        case Excellent = "Excellent"
        case Good = "Good"
        case Low = "Low"
        case VeryLow = "VeryLow"
        case Unknown = "Unknown"
        
    }
    
    
    private func drawRect(rect : CGRect, rectBgColor:UIColor, rectCornerRadius:CGFloat, horizontalSpacing: CGFloat)
    {
        // Size of rounded rectangle
        let rectWidth = rect.width
        let rectHeight = rect.height
        
        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = rect.origin.x - rectWidth/2 //(self.frame.width  - rectWidth)  / 2
        let yf:CGFloat = rect.origin.y - rectHeight//(self.frame.height - rectHeight) / 2
        
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        
        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: rectCornerRadius).cgPath
        
        ctx.addPath(clipPath)
        ctx.setFillColor(rectBgColor.cgColor)
        ctx.closePath()
        ctx.fillPath()
        ctx.restoreGState()
        
    }
    
    
    @IBInspectable var baseColor: UIColor = UIColor.gray
    @IBInspectable var lowSignalColor: UIColor = UIColor.red
    @IBInspectable var moderateSignalColor: UIColor = UIColor.orange
    @IBInspectable var excellentSignalColor: UIColor = UIColor.green
    
    
    override public func draw(_ rect: CGRect) {
        
    
        switch signal {
        case .Excellent:
            
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor) = (excellentSignalColor, excellentSignalColor, excellentSignalColor, excellentSignalColor)
            
        case .Good:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor) = (moderateSignalColor, moderateSignalColor, moderateSignalColor, baseColor)
            
        case .Low:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor) = (lowSignalColor, lowSignalColor, baseColor, baseColor)
            
        case .VeryLow:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor) = (lowSignalColor, baseColor, baseColor, baseColor)
            
        case .Unknown:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor) = (baseColor, baseColor, baseColor, baseColor)
            
        }
       
        
        let horizontalSpacing = (bounds.width / 6) 
        let leadingEdge = bounds.width/15
        let secondStartPoint = CGPoint(x:horizontalSpacing*1 + leadingEdge , y: bounds.height * 0.85)
        let thirdStartPoint = CGPoint(x:horizontalSpacing*2 + leadingEdge, y: bounds.height * 0.85)
        let fourthStartPoint = CGPoint(x:horizontalSpacing*3 + leadingEdge , y: bounds.height * 0.85)
        let fifthStartPoint = CGPoint(x:horizontalSpacing*4 + leadingEdge, y: bounds.height * 0.85)
        
        let rectWidth = bounds.width/8
        
        let rect1 = CGRect(origin: secondStartPoint, size: CGSize(width: rectWidth, height: bounds.height * 0.35))
        drawRect(rect: rect1, rectBgColor: firstSignalBarColor, rectCornerRadius: rectWidth/5, horizontalSpacing: horizontalSpacing)
        
        let rect2 = CGRect(origin: thirdStartPoint, size: CGSize(width: rectWidth, height: bounds.height * 0.45))
        drawRect(rect: rect2, rectBgColor: secondSignalBarColor, rectCornerRadius: rectWidth/5, horizontalSpacing: horizontalSpacing)
        
        let rect3 = CGRect(origin: fourthStartPoint, size: CGSize(width: rectWidth, height: bounds.height * 0.55))
        drawRect(rect: rect3, rectBgColor: thirdSignalBarColor, rectCornerRadius: rectWidth/5, horizontalSpacing: horizontalSpacing)
        
        let rect4 = CGRect(origin: fifthStartPoint, size: CGSize(width: rectWidth, height: bounds.height * 0.65))
        drawRect(rect: rect4, rectBgColor: fourthSignalBarColor, rectCornerRadius: horizontalSpacing/5, horizontalSpacing: horizontalSpacing)
       
    }

}
