//
//  Optional+Coalesce.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Optional {
    /// A non-infix version of the coalescing operator `??` for use in transform chains.
    ///
    /// - parameters:
    ///   - defaultValue: A value of the `Wrapped` type used.
    ///
    /// - returns: The `defaultValue` when no `Wrapped` value exists.
    ///
    func coalesce(_ defaultValue: Wrapped) -> Wrapped {
        switch self {
        case let .some(wrapped):
            return wrapped
        case .none:
            return defaultValue
        }
    }

    /// A non-infix version of the coalescing operator `??` for use in transform chains.
    ///
    /// This overload (version) takes a transform for use when computations are needed to produce the coalesced value.
    ///
    /// - parameters:
    ///   - coalescingTransform: A transform that produces a `Wrapped` value.
    ///
    /// - returns: The `defaultValue` when no `Wrapped` value exists.
    ///
    func coalesce(_ coalescingAction: () -> Wrapped) -> Wrapped {
        switch self {
        case let .some(wrapped):
            return wrapped
        case .none:
            return coalescingAction()
        }
    }
}
