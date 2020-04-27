//
//  UIView+Gradient.swift
//  BaseKit
//
//  Created by Martin Vasilev on 10.10.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

public typealias GradientAnchorPoints = (startAnchor: CGPoint, endAnchor: CGPoint)

public enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
    case custom(GradientAnchorPoints)
    
    public var anchorPoints: GradientAnchorPoints {
        switch self {
        case .leftToRight:
            return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
        case .rightToLeft:
            return (CGPoint(x: 1.0, y: 0.5), CGPoint(x: 0.0, y: 0.5))
        case .topToBottom:
            return (CGPoint(x: 0.5, y: 0.0), CGPoint(x: 0.5, y: 1.0))
        case .bottomToTop:
            return (CGPoint(x: 0.5, y: 1.0), CGPoint(x: 0.5, y: 0.0))
        case .custom(let anchorPoints):
            return anchorPoints
        }
    }
}

public extension UIView {
    /// Sets a background gradient across the provided colors with a direction and a distribution
    ///
    /// - Parameters:
    ///   - colors: The colors on which the gradient is created
    ///   - direction: The direction of the color gradient change
    ///   - distribution: The distribution of the colors (if you provide custom it should have the same ammount of steps as your colors.count for best results)
    /// - Returns: The created gradient layer
    @discardableResult
    func setGradientBackground(colors: [UIColor],
                               direction: GradientDirection = .topToBottom,
                               distribution: [NSNumber]? = nil) -> CAGradientLayer {
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Set the colors
        gradientLayer.colors = colors.compactMap { $0.cgColor }
        
        // Set the direction through start and end anchor point
        gradientLayer.startPoint = direction.anchorPoints.startAnchor
        gradientLayer.endPoint = direction.anchorPoints.endAnchor
        
        // Set the locations which the determine the colors distribution
        gradientLayer.locations = distribution
        
        // Set the frame and insert the gradient layer as a background
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
        return gradientLayer
    }
}

public extension CAGradientLayer {
    
    func animateGradientColors(colors: [UIColor], duration: Double = 0.5) {
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = duration
        colorChangeAnimation.fromValue = self.colors
        colorChangeAnimation.toValue = colors.compactMap { $0.cgColor }
        colorChangeAnimation.fillMode = CAMediaTimingFillMode.both
        colorChangeAnimation.isRemovedOnCompletion = false
        add(colorChangeAnimation, forKey: "colorChange")
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.colors = colors.compactMap { $0.cgColor }
        }
    }
    
}
