//
//  Controls+Bindable.swift
//  SFBaseKit
//
//  Created by Nikola B Nikolov on 19.10.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

// MARK: - UITextField + Bindable
@available(iOS 13, *)
extension UITextField: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
    }
    
    public var value: String {
        text ?? ""
    }
    
    public func setValue(_ value: String, animateUpdates: Bool) {
        text = value
    }
}

// MARK: - UISwitch + Bindable
@available(iOS 13, *)
extension UISwitch: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .switchDidChangeState, object: self)
    }
    
    public var value: Bool {
        isOn
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Bool, animateUpdates: Bool) {
        setOn(value, animated: animateUpdates)
    }
    
    @objc private func switchChanged() {
        NotificationCenter.default.post(Notification(name: .switchDidChangeState, object: self))
    }
}

// MARK: - UITextView + Bindable
@available(iOS 13, *)
extension UITextView: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UITextView.textDidChangeNotification, object: self)
    }
    
    public var value: String {
        text ?? ""
    }
    
    public func setValue(_ value: String, animateUpdates: Bool) {
        text = value
    }
}

// MARK: - UISlider + Bindable
@available(iOS 13, *)
extension UISlider: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .sliderDidChangeValue, object: self)
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Float, animateUpdates: Bool) {
        setValue(value, animated: animateUpdates)
    }
    
    @objc private func sliderChanged() {
        NotificationCenter.default.post(Notification(name: .sliderDidChangeValue, object: self))
    }
}

// MARK: - UIStepper + Bindable
@available(iOS 13, *)
extension UIStepper: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .stepperDidChangeValue, object: self)
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Double, animateUpdates: Bool) {
        self.value = value
    }
    
    @objc private func stepperChanged() {
        NotificationCenter.default.post(Notification(name: .stepperDidChangeValue, object: self))
    }
}

// MARK: - UISegmentedControl + Bindable
@available(iOS 13, *)
extension UISegmentedControl: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .segementedControlDidChangeSelectedIndex, object: self)
    }
    
    public var value: Int {
        selectedSegmentIndex
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(selectedIndexChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Int, animateUpdates: Bool) {
        selectedSegmentIndex = value
    }
    
    @objc private func selectedIndexChanged() {
        NotificationCenter.default.post(Notification(name: .segementedControlDidChangeSelectedIndex, object: self))
    }
}

// MARK: - UIDatePicker + Bindable
@available(iOS 13, *)
extension UIDatePicker: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .datePickerDidChangeValue, object: self)
    }
    
    public var value: Date {
        date
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Date, animateUpdates: Bool) {
        setDate(value, animated: animateUpdates)
    }
    
    @objc private func datePickerChanged() {
        NotificationCenter.default.post(Notification(name: .datePickerDidChangeValue, object: self))
    }
}

// MARK: - UIPageControl + Bindable
@available(iOS 13, *)
extension UIPageControl: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .pageControlDidChangeCurrentPage, object: self)
    }
    
    public var value: Int {
        currentPage
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(currentPageChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: Int, animateUpdates: Bool) {
        currentPage = value
    }
    
    @objc private func currentPageChanged() {
        NotificationCenter.default.post(Notification(name: .pageControlDidChangeCurrentPage, object: self))
    }
}

// MARK: - UIColorWell + Bindable
@available(iOS 14, *)
extension UIColorWell: Bindable {
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: .colorWellDidChangeSelectedColor, object: self)
    }
    
    public var value: UIColor {
        selectedColor ?? .clear
    }
    
    public func addTarget() {
        addTarget(self, action: #selector(selectedColorChanged), for: .valueChanged)
    }
    
    public func setValue(_ value: UIColor, animateUpdates: Bool) {
        selectedColor = value
    }
    
    @objc private func selectedColorChanged() {
        NotificationCenter.default.post(Notification(name: .colorWellDidChangeSelectedColor, object: self))
    }
}
