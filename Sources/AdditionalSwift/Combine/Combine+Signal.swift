//
//  Combine+Signal.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//


#if canImport(Combine)
import Combine

/// The `Signal` type is an empty value type intended to act like the `Void` type but with the ability to be distinguishable
/// (`Hashable`) from other instances of itself.
///
/// The motivation for this type is to enable systems that utilize diffing algorithms to be able
/// to intercept this type instead of `Void`, which is not distinct accross instances, so that a change or event can be recognized through
/// reactive frameworks like `Combine`.
///
/// - warning: This is intended to be an uninhabited type. You can add transforms but **do not add properties** to it.
///
@available(OSX 10.15, iOS 10.0, tvOS 13.0, watchOS 6.0, *)
public struct Signal: Hashable { }

/// These extensions are inspired by operators found and used extensively in SwiftNIO, a high performance non-blocking IO framework
/// used in server-side development. They are essentially used to inject content of your own choosing while ignoring the incoming
/// content provided upstream. The naming `transform` was chosen to be consistent with prior-art (this is how it is named else
/// where).
@available(OSX 10.15, iOS 10.0, tvOS 13.0, watchOS 6.0, *)
public extension Combine.Publisher {

    /// Ignores the incoming content and inserts `Signal` for the downstream.
    func transformSignal() -> Combine.Publishers.Map<Self, Signal> {
        return transform(to: Signal())
    }

}
#endif
