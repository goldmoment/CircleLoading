//
//  CircleLoading.swift
//  CircleLoading
//
//  Created by Vien Van Nguyen on 2/11/17.
//  Copyright © 2017 Vien Van Nguyen. All rights reserved.
//

import UIKit

public class CircleLoading: UIView {
    private var color1 = UIColor(red:0.98, green:0.43, blue:0.06, alpha:1.0)
    private var color2 = UIColor(red:0.97, green:0.67, blue:0.13, alpha:1.0)
    private var color3 = UIColor(red:0.85, green:0.11, blue:0.00, alpha:1.0)
    
    private var c1, c2, c3, c4, c5, c6, c7, c8, c9: CAShapeLayer!
    private var state: State = .none
    public var duration: Double = 2.0
    
    private enum State {
        case start
        case stop
        case pause
        case resume
        case none
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        settup()
    }
    
    public func colors(color1: UIColor, color2: UIColor, color3: UIColor) {
        self.color1 = color1
        self.color2 = color2
        self.color3 = color3
        
        [c1, c2, c3, c4, c5, c6, c7, c8, c9].forEach { (c) in
            c?.removeFromSuperlayer()
        }
        
        settup()
    }
    
    public func start() {
        if state == .none || state == .stop {
            [c1, c2, c5, c7, c8, c9].forEach { (c) in
                c?.isHidden = false
                c?.add(rotateAnimation(duration: random(min: duration * 0.4, max: duration * 0.5)), forKey: "transform.rotation")
                c?.add(scaleAnimation(duration: 2), forKey: "transform.scale123")
            }
            
            [c3, c4, c6].forEach { (c) in
                c?.isHidden = false
                c?.add(rotateAnimation(duration: random(min: duration * 0.6, max: duration), direction: -1.0), forKey: "transform.rotation")
                c?.add(scaleAnimation(duration: 2), forKey: "transform.scale123")
            }
            
            state = .start
        }
    }
    
    public func stop() {
        if state != .none && state != .stop {
            [c1, c2, c3, c4, c5, c6, c7, c8, c9].forEach { (c) in
                c?.removeAllAnimations()
                c?.isHidden = true
            }
            
            state = .stop
        }
    }
    
    public func pause() {
        if state == .start {
            let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0.0
            layer.timeOffset = pausedTime
            
            state = .pause
        }
    }
    
    public func resume(){
        if state == .pause {
            let pausedTime = layer.timeOffset
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
            
            state = .resume
        }
    }

    
    private func settup() {
        self.layoutIfNeeded()
        self.backgroundColor = UIColor.clear
        
        let baseWidth: CGFloat = 6.0 * self.bounds.width / 60

        let r1 = self.bounds.size.width / 2
        c1 = createCircle(radius: r1, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.8), endAngle: CGFloat(M_PI * 1.2), color: color1.withAlphaComponent(0.5))
        
        let r2 = self.bounds.size.width / 2 - baseWidth * 0.5
        c2 = createCircle(radius: r2, lineWidth: baseWidth * 0.5, startAngle: CGFloat(M_PI * 0.4), endAngle: CGFloat(M_PI * 1.3), color: color2.withAlphaComponent(0.5))
        
        let r3 = self.bounds.size.width / 2 - baseWidth - 1
        c3 = createCircle(radius: r3, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.35), endAngle: CGFloat(M_PI * 1.1), color: color1.withAlphaComponent(0.6))
        
        let r4 = self.bounds.size.width / 2 - baseWidth * 1.25
        c4 = createCircle(radius: r4, lineWidth: baseWidth * 0.5, startAngle: CGFloat(M_PI * 0.2), endAngle: CGFloat(M_PI * 0.9), color: color1.withAlphaComponent(0.6))
        
        let r5 = self.bounds.size.width / 2 - baseWidth * 0.3
        c5 = createCircle(radius: r5, lineWidth: baseWidth, startAngle: CGFloat(M_PI * 0.25), endAngle: CGFloat(M_PI * 0.7), color: color1.withAlphaComponent(0.4))
        
        let r6 = self.bounds.size.width / 2 - baseWidth - 1
        c6 = createCircle(radius: r6, lineWidth: baseWidth * 0.5, startAngle: CGFloat(-M_PI * 0.2), endAngle: CGFloat(M_PI * 0.45), color: color3.withAlphaComponent(0.8))
        
        let r7 = self.bounds.size.width / 2 - baseWidth * 0.6
        c7 = createCircle(radius: r7, lineWidth: baseWidth * 0.8, startAngle: CGFloat(-M_PI * 0.1), endAngle: CGFloat(M_PI * 0.2), color: color3.withAlphaComponent(0.8))
        
        let r8 = self.bounds.size.width / 2 - baseWidth * 0.2
        c8 = createCircle(radius: r8, lineWidth: baseWidth * 0.8, startAngle: CGFloat(-M_PI * 0.6), endAngle: CGFloat(0), color: color1.withAlphaComponent(0.8))
        
        let r9 = self.bounds.size.width / 2 - baseWidth * 0.5
        c9 = createCircle(radius: r9, lineWidth: 1, startAngle: CGFloat(-M_PI * 0.4), endAngle: CGFloat(-M_PI * 0.2), color: UIColor.white)
        
        self.layer.addSublayer(c2)
        self.layer.addSublayer(c1)
        self.layer.addSublayer(c6)
        self.layer.addSublayer(c7)
        self.layer.addSublayer(c3)
        self.layer.addSublayer(c4)
        self.layer.addSublayer(c5)
        self.layer.addSublayer(c8)
        self.layer.addSublayer(c9)
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
