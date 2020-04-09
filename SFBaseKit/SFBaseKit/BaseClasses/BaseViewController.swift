//
//  BaseViewController.swift
//  BaseKit
//
//  Created by Martin Vasilev on 1.08.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

/// Use left/right side menu type by overriding them and providing specific type
/// Make sure to add logic in imageForSideMenuType and titleForSideMenuType
/// Make sure to handle the menuActions in didPressSideMenuType or in custom overriden action
/// - none: Adds no button
public enum SideMenuType {
    //TODO: adding out of the box types for convenience use
    //(title/images) for those types could be configured by the IP
    case none
}

public enum PullToRefreshType {
    case `default`(color: UIColor?)
    case custom(view: UIView)
}

open class BaseViewController: UIViewController {
    
    open var name: String {
        return String(describing: classForCoder)
    }
    
    open var leftSideMenuType: SideMenuType {
        return .none
    }
    open var rightSideMenuType: SideMenuType {
        return .none
    }
    
    /// Override for custom logic on side menu click
    open var leftSideMenuAction: (() -> Void)? {
        return nil
    }
    
    /// Override for custom logic on side menu click
    open var rightSideMenuAction: (() -> Void)? {
        return nil
    }
    
    private var pullToRefreshCustomView: UIView?
    
    /// Override for custom logic for pull to refresh
    open var pullToRefreshAction: (() -> Void)? {
        preconditionFailure("Override pullToRefreshAction if you're using pull to refresh")
    }
    
    /// Use by adding the refresh control and overriding pullToRefreshAction
    open lazy var refreshControl: UIRefreshControl = {
        let refreshControl: UIRefreshControl = UIRefreshControl()

        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // show settings button on the top right if needed
        if leftSideMenuType != .none {
            let leftBarButtonItem = barButtonItemForType(leftSideMenuType, action: #selector(didPressLeftSideMenu))
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        if rightSideMenuType != .none {
            let rightBarButtonItem = barButtonItemForType(rightSideMenuType, action: #selector(didPressRightSideMenu))
            navigationItem.rightBarButtonItem = rightBarButtonItem
        }
        
        //register for keyboard notifications
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleDidEnterBackground),
                                               name:  .didEnterBackground,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleWillEnterForeground),
                                               name: .willEnterForeground,
                                               object: nil)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .willEnterForeground, object: nil)
        NotificationCenter.default.removeObserver(self, name: .didEnterBackground, object: nil)
    }
    
    /// Called on receiving system notification `keyboardWillShowNotification`.
    @objc open func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardWillShowWithHeight(keyboardSize.height)
        }
    }
    
    /// Called on receiving system notification `keyboardWillShowNotification` with calculated keyboard height.
    /// - Parameter height: `CGFloat` height of the keyboard to be shown.
    @objc open func keyboardWillShowWithHeight(_ height: CGFloat) {
    }
    
    /// Called on receiving system notification `keyboardWillHideNotification`.
    @objc open func keyboardWillHide(notification: Notification) {
    }
    
    /// Override for specific cases
    @objc open func handleDidEnterBackground() {}
    
    /// Override for specific cases
    @objc open func handleWillEnterForeground() {}
    
    @objc private func didPressLeftSideMenu() {
        if let customAction = leftSideMenuAction {
            customAction()
        } else {
            didPressSideMenuType(leftSideMenuType)
        }
    }
    
    @objc private func didPressRightSideMenu() {
        if let customAction = rightSideMenuAction {
            customAction()
        } else {
            didPressSideMenuType(rightSideMenuType)
        }
    }
    
    @objc private func didPullToRefresh() {
        guard let refreshControlScroll = refreshControl.superview as? UIScrollView else { return }
        if refreshControlScroll.panGestureRecognizer.state == .changed {
            // The user hasn't lifted his finger yet
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                self?.didPullToRefresh()
            }
        } else {
            // Only start the actual refresh when the pan gesture is in state ended/canceled
            pullToRefreshAction?()
            
        }
    }
    
    /// You can set a custom refresh control type. Either just a tint color of the default one
    /// or some custom view with custom animation logic.
    /// Important! -> make sure to call this BEFORE any pull to refresh happens if you want the changes to
    /// be preloaded when it does. pullToRefreshAction is NOT the place for this..
    /// - Parameter pullToRefreshType: The type that you want to set
    open func setRefreshControl(with pullToRefreshType: PullToRefreshType) {
        pullToRefreshCustomView?.removeFromSuperview()
        switch pullToRefreshType {
        case .default(let color):
            refreshControl.tintColor = color
        case .custom(let customView):
            customView.frame = refreshControl.bounds
            customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            customView.contentMode = .scaleAspectFit
            refreshControl.tintColor = .clear
            refreshControl.addSubview(customView)
            pullToRefreshCustomView = customView
        }
    }
    
    private func didPressSideMenuType(_ type: SideMenuType) {
        //TODO: consider uncommenting when Logger is added to the project
//        switch type {
//        default:
//            Log.warning("Left side menu default action triggered")
//        }
    }
    
    private func barButtonItemForType(_ type: SideMenuType, action: Selector?) -> UIBarButtonItem? {
        let style = styleForSideMenuType(type)
        // check for image or title
        if let image = imageForSideMenuType(type) {
            return UIBarButtonItem(image: image, style: style, target: self, action: action)
        } else if let title = titleForSideMenuType(type) {
            return UIBarButtonItem(title: title, style: style, target: self, action: action)
        } else {
            return nil
        }
    }
    
    /// Add here images for side menu button items that require images
    ///
    /// - Parameter type: The side menu type enum
    /// - Returns: the UIImage for that type
    private func imageForSideMenuType(_ type: SideMenuType) -> UIImage? {
        switch type {
        default:
            return nil
        }
    }
    
    /// Add here titles for side menu button items that require titles
    ///
    /// - Parameter type: The side menu type enum
    /// - Returns: the title for that type
    private func titleForSideMenuType(_ type: SideMenuType) -> String? {
        switch type {
        default:
            return nil
        }
    }
    
    private func styleForSideMenuType(_ type: SideMenuType) -> UIBarButtonItem.Style {
        // Leaving for future use if there needs to be a new style added
        return .plain
    }
}
