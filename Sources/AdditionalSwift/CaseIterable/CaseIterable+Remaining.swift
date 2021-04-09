//
//  CaseIterable+Remaining.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension CaseIterable where Self: Equatable {

    /// A list of the remaining cases including the case this is called on.
    var remainingCases: [Self] {
        Self.allCases
            .drop { $0 != self }
            .map { $0 }
    }

    /// The next case found after `self` within the `allCases` array.
    var nextCase: Self? {
        remainingCases
            .dropFirst()
            .first
    }

}
