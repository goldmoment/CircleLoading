//
//  CircleLoading.swift
//  CircleLoading
//
//  Created by Vien Van Nguyen on 2/11/17.
//  Copyright © 2017 Vien Van Nguyen. All rights reserved.
//

import UIKit

class CircleLoading: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        settup()
    }
    
    private func settup() {
        self.layoutIfNeeded()
        self.backgroundColor = UIColor.clear
        
        let baseWidth: CGFloat = 6.0 * self.bounds.width / 60
        let color1 = UIColor(red:0.98, green:0.43, blue:0.06, alpha:1.0)
        let color2 = UIColor(red:0.97, green:0.67, blue:0.13, alpha:1.0)
        let color3 = UIColor(red:0.85, green:0.11, blue:0.00, alpha:1.0)
        
        let r1 = self.bounds.size.width / 2
        let c1 = createCircle(radius: r1, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.8), endAngle: CGFloat(M_PI * 1.2), color: color1.withAlphaComponent(0.5))
        
        let r2 = self.bounds.size.width / 2 - baseWidth * 0.5
        let c2 = createCircle(radius: r2, lineWidth: baseWidth * 0.5, startAngle: CGFloat(M_PI * 0.4), endAngle: CGFloat(M_PI * 1.3), color: color2.withAlphaComponent(0.5))
        
        let r3 = self.bounds.size.width / 2 - baseWidth - 1
        let c3 = createCircle(radius: r3, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.35), endAngle: CGFloat(M_PI * 1.1), color: color1.withAlphaComponent(0.6))
        
        let r4 = self.bounds.size.width / 2 - baseWidth * 1.25
        let c4 = createCircle(radius: r4, lineWidth: baseWidth * 0.5, startAngle: CGFloat(M_PI * 0.2), endAngle: CGFloat(M_PI * 0.9), color: color1.withAlphaComponent(0.6))
        
        let r5 = self.bounds.size.width / 2 - baseWidth * 0.3
        let c5 = createCircle(radius: r5, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.25), endAngle: CGFloat(M_PI * 0.7), color: color1.withAlphaComponent(0.4))
        
        let r6 = self.bounds.size.width / 2 - baseWidth - 1
        let c6 = createCircle(radius: r6, lineWidth: baseWidth * 0.5, startAngle: CGFloat(-M_PI * 0.2), endAngle: CGFloat(M_PI * 0.45), color: color3.withAlphaComponent(0.8))
        
        let r7 = self.bounds.size.width / 2 - baseWidth * 0.6
        let c7 = createCircle(radius: r7, lineWidth: baseWidth * 0.8, startAngle: CGFloat(-M_PI * 0.1), endAngle: CGFloat(M_PI * 0.2), color: color3.withAlphaComponent(0.8))
        
        let r8 = self.bounds.size.width / 2 - baseWidth * 0.2
        let c8 = createCircle(radius: r8, lineWidth: baseWidth * 0.8, startAngle: CGFloat(-M_PI * 0.6), endAngle: CGFloat(0), color: color1.withAlphaComponent(0.8))
        
        let r9 = self.bounds.size.width / 2 - baseWidth * 0.5
        let c9 = createCircle(radius: r9, lineWidth: 1, startAngle: CGFloat(-M_PI * 0.4), endAngle: CGFloat(-M_PI * 0.2), color: UIColor.white)
        
        
        self.layer.addSublayer(c2)
        self.layer.addSublayer(c1)
        self.layer.addSublayer(c6)
        self.layer.addSublayer(c7)
        self.layer.addSublayer(c3)
        self.layer.addSublayer(c4)
        self.layer.addSublayer(c5)
        self.layer.addSublayer(c8)
        self.layer.addSublayer(c9)
        
        [c1, c2, c5, c7, c8, c9].forEach { (c) in
            c.add(rotateAnimation(duration: random(min: 0.8, max: 1.0)), forKey: "transform.rotation")
            c.add(scaleAnimation(duration: 2), forKey: "transform.scale")
        }
        
        [c3, c4, c6].forEach { (c) in
            c.add(rotateAnimation(duration: random(min: 1.2, max: 2.0), direction: -1.0), forKey: "transform.rotation")
            c.add(scaleAnimation(duration: 2), forKey: "transform.scale")
        }
    }
    
    private func createCircle(radius: CGFloat, lineWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        let radius = radius - lineWidth / 2
        let circlePath = UIBezierPath(arcCenter: self.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        layer.bounds = self.frame
        layer.path = circlePath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = color.cgColor
        layer.lineWidth = lineWidth
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.position = self.bounds.center
        
        return layer
    }
    
    private func rotateAnimation(duration: CFTimeInterval, direction: Double = 1.0) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = duration
        animation.fromValue = 0.0
        animation.toValue = CGFloat(direction * M_PI * 2)
        animation.repeatCount = HUGE
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        return animation
    }
    
    private func scaleAnimation(duration: CFTimeInterval) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = duration
        animation.fromValue = 0.6
        animation.toValue = 1.0
        animation.repeatCount = HUGE
        animation.autoreverses = true
        return animation
    }
    
    private func random(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    private func random(min: Float, max: Float) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    private func random(min: Double, max: Double) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
