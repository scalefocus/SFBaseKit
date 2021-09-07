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
    /// - Parameter receiveValue: The closure to execute with the new value.
    public func sink(on dispatchQueue: DispatchQueue = .main, receiveValue: @escaping (T) -> Void) {
        subject
            .receive(on: dispatchQueue)
            .sink(receiveValue: receiveValue)
            .store(in: &cancellables)
    }
}
#endif
