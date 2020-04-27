//
//  UIView+Animations.swift
//  BaseKit
//
//  Created by Martin Vasilev on 28.08.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Start wiggle animation. The animation is infinite but specifying totalDuration interrupts it after a delay
    /// The wiggle animation consists of position displacement and slight rotation transform
    /// - Parameters:
    ///   - cycleDuration: The duration of a single wiggle cycle - default 0.25
    ///   - totalDuration: The total duration if there is a need to interrupt it - default nil
    ///   - displacement: The position displacement value in the wiggle animation in a single cycle - default 1.0
    ///   - degreesRotation: The rotation degrees angle in which the view is rotated in a single cycle - default 2.0
    func startWiggle(cycleDuration: Double = 0.25,
                     totalDuration: Double? = nil,
                     displacement: CGFloat = 1.0,
                     degreesRotation: CGFloat = 2.0) {
        
        let negativeDisplacement = -1.0 * displacement
        let position = CAKeyframeAnimation.init(keyPath: "position")
        position.beginTime = 0.8
        position.duration = cycleDuration
        position.values = [
            NSValue(cgPoint: CGPoint(x: negativeDisplacement, y: negativeDisplacement)),
            NSValue(cgPoint: CGPoint(x: 0, y: 0)),
            NSValue(cgPoint: CGPoint(x: negativeDisplacement, y: 0)),
            NSValue(cgPoint: CGPoint(x: 0, y: negativeDisplacement)),
            NSValue(cgPoint: CGPoint(x: negativeDisplacement, y: negativeDisplacement))
        ]
        position.calculationMode = CAAnimationCalculationMode.linear
        position.isRemovedOnCompletion = false
        position.repeatCount = Float.greatestFiniteMagnitude
        position.beginTime = CFTimeInterval(Float(arc4random()).truncatingRemainder(dividingBy: Float(25)) / Float(100))
        position.isAdditive = true
        
        let transform = CAKeyframeAnimation.init(keyPath: "transform")
        transform.beginTime = 2.6
        transform.duration = cycleDuration
        transform.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        transform.values = [
            degreesToRadians(-1.0 * degreesRotation),
            degreesToRadians(degreesRotation),
            degreesToRadians(-1.0 * degreesRotation)
        ]
        transform.calculationMode = CAAnimationCalculationMode.linear
        transform.isRemovedOnCompletion = false
        transform.repeatCount = Float.greatestFiniteMagnitude
        transform.isAdditive = true
        transform.beginTime = CFTimeInterval(Float(arc4random()).truncatingRemainder(dividingBy: Float(25)) / Float(100))
        
        layer.add(position, forKey: "wigglePosition")
        layer.add(transform, forKey: "wiggleTransform")
        
        if let totalDuration = totalDuration {
            DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) { [weak self] in
                self?.stopWiggle()
            }
        }
    }
    
    /// Stops wiggle animations (it completely stops them without any animation.. perhaps later some logic for making a smooth transition to identity is required)
    func stopWiggle() {
        layer.removeAnimation(forKey: "wigglePosition")
        layer.removeAnimation(forKey: "wiggleTransform")
    }
    
    /// Animate clicking on view
    func animatedClick() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 0.99
        animation.autoreverses = true
        animation.damping = 1
        animation.duration = 0.2
        animation.initialVelocity = 0.5
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "animatedClick")
    }
    
    /// The view will fade in if his alpha was less than 1.0
    ///
    /// - Parameters:
    ///   - withDuration: the duration for the fading
    ///   - completion: code that will be called after the fading
    func fadeIn(withDuration: Double, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: withDuration, animations: { [weak self] in
            self?.alpha = 1.0
        }, completion: completion)
    }
    
    /// The view will fade out if his alpha was more than 0.0
    ///
    /// - Parameters:
    ///   - withDuration: the duration for the fading
    ///   - completion: code that will be called after the fading
    func fadeOut(withDuration: Double, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: withDuration, animations: { [weak self] in
            self?.alpha = 0.0
        }, completion: completion)
    }
    
    private func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
        return .pi * degrees / 180.0
    }
    
}
