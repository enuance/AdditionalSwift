//
//  Result+Pure.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Result {
    /// Type lifting when Compiler inference is available
    static func pure(_ value: Success) -> Result<Success, Failure> {
        return .success(value)
    }

    /// Type lifting when Compiler inference is not available
    static func pure(failedBy: Failure.Type, _ value: Success) -> Result<Success, Failure> {
        return .success(value)
    }
}
