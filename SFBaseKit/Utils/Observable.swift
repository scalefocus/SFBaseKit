//
//  Observable.swift
//  SFBaseKit
//
//  Created by Plamen Penchev on 19.05.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//
#if canImport(Combine)
import Foundation
import Combine

@available(iOS 13, *)
/// Object that represents an observable to which subscribers can attach.
/// Current implementation relies entirely on Combines `CurrentValueSubject`,
/// therefore it's available for iOS 13+ only.
public final class Observable<T> {
    private let subject: CurrentValueSubject<T, Never>
    private var cancellables = Set<AnyCancellable>()
    
    /// The current value held in the observable.
    public var value: T {
        set {
            subject.send(newValue)
        }
        get {
            subject.value
        }
    }

    public init(_ value: T) {
        self.subject = CurrentValueSubject(value)
    }
    
    /// Attaches a closure to execute when the binding value changes.
    /// The closure is executed on attachment.
    /// - Parameter receiveValue: The closure to execute with the new value.
    public func sinkAndFire(on dispatchQueue: DispatchQueue = .main, receiveValue: @escaping (T) -> Void) {
        subject
            .receive(on: dispatchQueue)
            .sink(receiveValue: receiveValue)
            .store(in: &cancellables)
    }
    
    /// Attaches a closure to execute when the binding value changes.
    /// The closure is not executed on attachment.
    /// - Parameter receiveValue: The closure to execute with the new value.
    public func sink(on dispatchQueue: DispatchQueue = .main, receiveValue: @escaping (T) -> Void) {
        subject
            .dropFirst()
            .receive(on: dispatchQueue)
            .sink(receiveValue: receiveValue)
            .store(in: &cancellables)
    }
    
    /// Binds the observable value to the values received from a Bindable's Publisher.
    /// - Parameters:
    ///   - bindable: A bindable object to receive values from.
    public func sink<B: Bindable>(with bindable: B, on dispatchQueue: DispatchQueue = .main, animateUpdates: Bool = true) {
        bindable.publisher
            .map { bindable.value(from: $0) }
            .receive(on: dispatchQueue)
            .sink { [weak self] in self?.setValue($0 as? T) }
            .store(in: &cancellables)
        
        sinkAndFire { value in
            guard let value = value as? B.BindingType else { return }
            
            bindable.setValue(value, animateUpdates: animateUpdates)
        }
    }
    
    /// Sets the observable value.
    private func setValue(_ value: T?) {
        guard let value = value else { return }
        
        self.value = value
    }
}
#endif
