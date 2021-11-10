//
//  UIStackView+ShowAndHideArrangedSubview.swift
//  SFBaseKit
//
//  Created by Aleksandar Gyuzelov on 15.02.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

extension UIStackView {
    
    /// Adds views to the arrangedSubviews and makes them visible.
    func addAndShowArrangedSubview(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
            $0.isHidden = false
        }
    }
    
    /// Removes views from the arrangedSubviews and hides them.
    /// Used to prevent a case where the last arrangedSubview is removed, but remains visible.
    func removeAndHideArrangedSubview(_ views: UIView...) {
        views.forEach {
            removeArrangedSubview($0)
            $0.isHidden = true
        }
    }
    
    /// Swaps two arranged subviews with options for animation.
    /// - Parameters:
    ///   - firstView: First view to swap.
    ///   - secondView: Second view to swap.
    ///   - shouldAnimateSwap: Whether to animate the swap.
    ///   - duration: Animation duration.
    ///   - delay: Animation delay.
    ///   - options: Animation options.
    ///   - completion: Completion handler to execute when the animation finishes.
    func swap(_ firstView: UIView,
              _ secondView: UIView,
              shouldAnimateSwap: Bool = true,
              duration: TimeInterval = 0.25,
              delay: TimeInterval = 0,
              options: UIView.AnimationOptions = .curveLinear,
              completion: ((Bool) -> Void)? = nil) {
        guard shouldAnimateSwap else {
            swapViews(firstView, secondView)
            return
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            self.swapViews(firstView, secondView)
            self.layoutIfNeeded()
        }, completion: completion)
    }
    
    /// Swaps two arranged subviews.
    /// - Parameters:
    ///   - firstView: First view to swap.
    ///   - secondView: Second view to swap.
    private func swapViews(_ firstView: UIView, _ secondView: UIView) {
        guard let firstViewIndex = arrangedSubviews.firstIndex(of: firstView),
              let secondViewIndex = arrangedSubviews.firstIndex(of: secondView) else { return }
        
        removeArrangedSubview(firstView)
        insertArrangedSubview(firstView, at: secondViewIndex)
        removeArrangedSubview(secondView)
        insertArrangedSubview(secondView, at: firstViewIndex)
    }
}
