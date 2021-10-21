//
//  UIControls+Bindable.swift
//  SFBaseKit
//
//  Created by Nikola B Nikolov on 19.10.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

// MARK: - UITextField + Bindable
@available(iOS 13, *)
extension UITextField: Bindable {
    public typealias BindingType = String
    
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UITextField else { return "" }
        return object.text ?? ""
    }
    
    public func setValue(_ value: String, animateUpdates: Bool) {
        text = value
    }
}

// MARK: - UISwitch + Bindable
@available(iOS 13, *)
extension UISwitch: Bindable {
    public typealias BindingType = Bool
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .switchDidChangeState, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UISwitch else { return false }
        return object.isOn
    }
    
    public func setValue(_ value: Bool, animateUpdates: Bool) {
        setOn(value, animated: animateUpdates)
    }
    
    @objc private func switchChanged() {
        NotificationCenter.default.post(Notification(name: .switchDidChangeState, object: self))
    }
}

// MARK: - UISlider + Bindable
@available(iOS 13, *)
extension UISlider: Bindable {
    public typealias BindingType = Float
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .sliderDidChangeValue, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UISlider else { return 0 }
        return object.value
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
    public typealias BindingType = Double
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .stepperDidChangeValue, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UIStepper else { return 0 }
        return object.value
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
    public typealias BindingType = Int
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(selectedIndexChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .segementedControlDidChangeSelectedIndex, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UISegmentedControl else { return 0 }
        return object.selectedSegmentIndex
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
    public typealias BindingType = Date
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .datePickerDidChangeValue, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UIDatePicker else { return Date() }
        return object.date
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
    public typealias BindingType = Int
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(currentPageChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .pageControlDidChangeCurrentPage, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UIPageControl else { return 0 }
        return object.currentPage
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
    public typealias BindingType = UIColor
    
    public var publisher: NotificationCenter.Publisher {
        addTarget(self, action: #selector(selectedColorChanged), for: .valueChanged)
        
        return NotificationCenter.default.publisher(for: .colorWellDidChangeSelectedColor, object: self)
    }
    
    public func value(from output: NotificationCenter.Publisher.Output) -> BindingType {
        guard let object = output.object as? UIColorWell else { return .clear }
        return object.selectedColor ?? .clear
    }
    
    public func setValue(_ value: UIColor, animateUpdates: Bool) {
        selectedColor = value
    }
    
    @objc private func selectedColorChanged() {
        NotificationCenter.default.post(Notification(name: .colorWellDidChangeSelectedColor, object: self))
    }
}
