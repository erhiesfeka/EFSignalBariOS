//
//  RSSIIndicatorView.swift
//  EFSignalBariOS
//
//  Created by Erhies Fekarurhobo on 2017-09-13.
//  Copyright © 2017 Ratatat. All rights reserved.
//

import UIKit

@IBDesignable class EFSignalBarView: UIView {

    var firstSignalBarColor:UIColor = UIColor()
    var secondSignalBarColor:UIColor = UIColor()
    var thirdSignalBarColor:UIColor = UIColor()
    var fourthSignalBarColor:UIColor = UIColor()
    var fifthSignalBarColor:UIColor = UIColor()
    
    @IBInspectable public var signal: SignalStrength = .Unknown{
        didSet {
            setNeedsDisplay()
        }
    }
    public enum SignalStrength: String {
        
        case Excellent = "Excellent"
        case VeryGood = "VeryGood"
        case Good = "Good"
        case Low = "Low"
        case VeryLow = "VeryLow"
        case Unknown = "Unknown"
        
    }
    
    private func drawRoundedRect(shapeLayer: CAShapeLayer, horizontalSpacing: CGFloat, signalBar:UIBezierPath, barColour: UIColor){
        shapeLayer.removeFromSuperlayer()
        shapeLayer.path = signalBar.cgPath
        
        shapeLayer.strokeColor = barColour.cgColor
        shapeLayer.lineWidth = horizontalSpacing * 0.5
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.removeFromSuperlayer()
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
    @IBInspectable var baseColor: UIColor = UIColor.gray
    @IBInspectable var lowSignalColor: UIColor = UIColor.red
    @IBInspectable var moderateSignalColor: UIColor = UIColor.orange
    @IBInspectable var excellentSignalColor: UIColor = UIColor.green
    
    
    override func draw(_ rect: CGRect) {
        
        
        let horizontalSpacing = bounds.width / 8
        let firstStartPoint = CGPoint(x:horizontalSpacing, y: bounds.height * 0.85)
        let secondStartPoint = CGPoint(x:horizontalSpacing*2 , y: bounds.height * 0.85)
        let thirdStartPoint = CGPoint(x:horizontalSpacing*3 , y: bounds.height * 0.85)
        let fourthStartPoint = CGPoint(x:horizontalSpacing*4 , y: bounds.height * 0.85)
        let fifthStartPoint = CGPoint(x:horizontalSpacing*5 , y: bounds.height * 0.85)
        
        
        let verticalHeightIncrement = bounds.height
        let firstEndPoint = CGPoint(x:horizontalSpacing, y: verticalHeightIncrement * 0.8)
        let secondEndPoint = CGPoint(x:horizontalSpacing*2, y: verticalHeightIncrement*0.6)
        let thirdEndPoint = CGPoint(x:horizontalSpacing*3, y: verticalHeightIncrement*0.4)
        let fourthEndPoint = CGPoint(x:horizontalSpacing*4, y: verticalHeightIncrement*0.2)
        let fifthEndPoint = CGPoint(x:horizontalSpacing*5, y: 0)
        
        let firstSignalBar = UIBezierPath()
        let secondSignalBar = UIBezierPath()
        let thirdSignalBar = UIBezierPath()
        let fourthSignalBar = UIBezierPath()
        let fifthSignalBar = UIBezierPath()
        
        
        firstSignalBar.move(to: firstStartPoint)
        firstSignalBar.addLine(to: firstEndPoint)
        
        secondSignalBar.move(to: secondStartPoint)
        secondSignalBar.addLine(to: secondEndPoint)
        
        thirdSignalBar.move(to: thirdStartPoint)
        thirdSignalBar.addLine(to: thirdEndPoint)
        
        fourthSignalBar.move(to: fourthStartPoint)
        fourthSignalBar.addLine(to: fourthEndPoint)
        
        fifthSignalBar.move(to: fifthStartPoint)
        fifthSignalBar.addLine(to: fifthEndPoint)
        
        switch signal {
        case .Excellent:
            
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (excellentSignalColor, excellentSignalColor, excellentSignalColor, excellentSignalColor, excellentSignalColor)
            
        case .VeryGood:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (excellentSignalColor, excellentSignalColor, excellentSignalColor, excellentSignalColor, baseColor)
            
        case .Good:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (moderateSignalColor, moderateSignalColor, moderateSignalColor, baseColor, baseColor)
            
        case .Low:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (lowSignalColor, lowSignalColor, baseColor, baseColor, baseColor)
            
        case .VeryLow:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (lowSignalColor, baseColor, baseColor, baseColor, baseColor)
            
        case .Unknown:
            (firstSignalBarColor, secondSignalBarColor, thirdSignalBarColor,fourthSignalBarColor,fifthSignalBarColor) = (baseColor, baseColor, baseColor, baseColor, baseColor)
            
        }
       
        
        let shapeLayer = CAShapeLayer()
        drawRoundedRect(shapeLayer: shapeLayer, horizontalSpacing: horizontalSpacing, signalBar: firstSignalBar, barColour: firstSignalBarColor)
        
        let shapeLayer2 = CAShapeLayer()
        drawRoundedRect(shapeLayer: shapeLayer2, horizontalSpacing: horizontalSpacing, signalBar: secondSignalBar, barColour: secondSignalBarColor)
        
        let shapeLayer3 = CAShapeLayer()
        drawRoundedRect(shapeLayer: shapeLayer3, horizontalSpacing: horizontalSpacing, signalBar: thirdSignalBar, barColour: thirdSignalBarColor)
        
        let shapeLayer4 = CAShapeLayer()
        drawRoundedRect(shapeLayer: shapeLayer4, horizontalSpacing: horizontalSpacing, signalBar: fourthSignalBar, barColour: fourthSignalBarColor)
    
        let shapeLayer5 = CAShapeLayer()
        drawRoundedRect(shapeLayer: shapeLayer5, horizontalSpacing: horizontalSpacing, signalBar: fifthSignalBar, barColour: fifthSignalBarColor)
    }

}
