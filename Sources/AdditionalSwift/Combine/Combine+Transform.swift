//
//  Combine+Transform.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if canImport(Combine)
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Combine.Publisher {

    /// Ignores the incoming content and inserts the provided `value` for the downstream.
    func transform<T>(to value: T) -> Combine.Publishers.Map<Self, T> {
        return map { _ in value }
    }

    /// Ignores the incoming content and inserts `Void` for the downstream.
    func transform() -> Combine.Publishers.Map<Self, Void> {
        return transform(to: ())
    }

}
#endif
