//
//  Combine+Cancellables.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if canImport(Combine)
import Combine

/// A helpful alias for a set of cancellables.
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public typealias Cancellables = Set<AnyCancellable>
#endif
