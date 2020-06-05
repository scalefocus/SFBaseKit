//
//  SimpleTabBarAnimation.swift
//  SFBaseKit
//
//  Created by Aleksandar Geyman on 27.05.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit

/// Available animations for UITabBarItems
public enum TabBarItemAnimation {
    case bounce
    case jump
    case rotate
    case custom((UIImageView) -> ())
}

public protocol SimpleTabBarAnimation {
    /// Animates UITabBarItem Image View with custom animation.
    ///
    /// Example implementation
    ///
    ///     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    ///         playAnimation(type: .scale, for: item)
    ///     }
    ///
    /// - Parameters:
    ///   - type: Desired animation provided from TabBarItemAnimation.
    ///   - item: UITabBarItem to be animated.
    func playAnimation(type: TabBarItemAnimation, for item: UITabBarItem)
}

/// Implementation of SimpleTabBarAnimation
public extension SimpleTabBarAnimation where Self: UITabBarController {
    func playAnimation(type: TabBarItemAnimation, for item: UITabBarItem) {
        let barItemIndex = tabBar.items?.firstIndex(of: item) ?? 0
        let subviewIndex = barItemIndex + 1
        guard subviewIndex < tabBar.subviews.count,
            let imageView = tabBar
                .subviews[subviewIndex]
                .subviews
                .first(where: {$0 is UIImageView}) as? UIImageView else { return }
        
        switch type {
        case .bounce:
            bounceAnimation(for: imageView)
        case .jump:
            jumpAnimation(for: imageView)
        case .rotate:
            rotateAnimation(for: imageView)
        case .custom(let animation):
            animation(imageView)
        }
    }
    
    private func bounceAnimation(for item: UIImageView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = 0.5
        bounceAnimation.calculationMode = .cubic
        
        item.layer.add(bounceAnimation, forKey: nil)
    }
    
    private func jumpAnimation(for item: UIImageView) {
        let jumpAnimation = CAKeyframeAnimation(keyPath: "position.y")
        jumpAnimation.values = [1.05, 1.1, 1.15, 1.1, 1.05]
        jumpAnimation.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        jumpAnimation.duration = 0.25
        
        item.layer.add(jumpAnimation, forKey: nil)
    }
    
    private func rotateAnimation(for item: UIImageView) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.duration = 0.4
        
        item.layer.add(rotateAnimation, forKey: nil)
    }
}
